//
//  Network.swift
//  iOS-Task Swift
//
//  Created by John Doe on 2021-12-25.
//

import Foundation

class NetworkLayer {
    
    static let shared = NetworkLayer()
    

    func getResults<M: Codable>(decodingModel: M.Type, completed: @escaping (Result<M,ErorrMessage> ) -> Void) {
     
        guard let url = URL(string:  Movies.getDefault.baseURL) else {return}
        print(url)
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ =  error {
                completed((.failure(.InvalidData)))
            }
            guard let data = data else {
                completed((.failure(.InvalidData)))
                return
            }
            guard let response =  response  as? HTTPURLResponse ,response.statusCode == 200 else{
                completed((.failure(.InvalidResponse)))
                return
            }
            
            do
            {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try decoder.decode(M.self, from: data)
                print(results)
                completed((.success(results)))
                
            }catch {
                completed((.failure(.InvalidData)))
            }
            
        }
        task.resume()
    }
    
}
