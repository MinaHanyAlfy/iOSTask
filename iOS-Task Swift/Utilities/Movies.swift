//
//  Movies.swift
//  iOS-Task Swift
//
//  Created by John Doe on 2021-12-25.
//

import Foundation
enum Movies{
    case getDefault
  
}

extension Movies: EndPoint{
    var baseURL: String {
        return "http://api.tvmaze.com/search/shows?q=Future"
        
    }
    
    var method: HTTPMethod {
        return .get
    }
}
