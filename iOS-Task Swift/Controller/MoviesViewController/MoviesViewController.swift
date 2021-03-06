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
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        moviesTableView.clipsToBounds = false
        moviesTableView.layer.cornerRadius = 8
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
        cell.premieredLabel.text = film?.show?.premiered
        cell.titleLabel?.text = film?.show?.name
        cell.runtimeLabel?.text = "\(film?.show?.runtime ?? 0)"
        let rate : Double = Double(film?.show?.rating?.average ?? 0 ) * 0.5
        cell.ratingView.rating = rate
        cell.navController = navigationController
        cell.link = film?.show?.url ?? ""
        let url = URL(string: film?.show?.image?.medium ?? "https://seeklogo.com/images/N/netflix-n-logo-0F1ED3EBEB-seeklogo.com.png")

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                cell.movieImageView.image = UIImage(data: data!)
            }
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        let film = data?[indexPath.row]
        vc.title = film?.show?.name
        vc.movieTitle = film?.show?.name
        vc.desc = film?.show?.summary
        vc.link = film?.show?.image?.original ?? "https://seeklogo.com/images/N/netflix-n-logo-0F1ED3EBEB-seeklogo.com.png"
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4 - 8
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
