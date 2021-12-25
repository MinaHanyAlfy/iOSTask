//
//  MoviesViewController.swift
//  iOS-Task Swift
//
//  Created by John Doe on 2021-12-25.
//

import UIKit

class MoviesViewController: UIViewController {
    var data: Films? {
        didSet{
            DispatchQueue.main.async {
                self.moviesTableView.reloadData()
            }
        }
    }
    @IBOutlet weak var moviesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        registCell()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.fetchData()
        }
       
    }
    func registCell(){
        moviesTableView.register(UINib.init(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "MoviesTableViewCell")
    }
   
    
}
extension MoviesViewController :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath) as! MoviesTableViewCell
        cell.textLabel?.text = "First"
        cell.detailTextLabel?.text = "SubFirst"
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HomeViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
}
extension MoviesViewController {
    private func fetchData(){
        NetworkLayer.shared.getResults(decodingModel: Films.self) { [weak self] (response) in
            switch response{
            case .success(let data):
                self?.data = data
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
