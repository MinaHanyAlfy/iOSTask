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
        title = "Movies"
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
        return data?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath) as! MoviesTableViewCell
        let film = data?[indexPath.row]
        cell.titleLabel?.text = film?.show?.name
        cell.scoreLabel?.text = "\(film?.score ?? 0.0)"
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.data = data
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 6 - 8
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
