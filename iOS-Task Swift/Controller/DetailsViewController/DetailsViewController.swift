//
//  DetailsViewController.swift
//  iOS-Task Swift
//
//  Created by John Doe on 2021-12-26.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieDescLabel: UILabel!
    var link: String?
    var desc: String?
    var movieTitle: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if desc != nil {
            let str = desc?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
//            let newSummery = desc?.stringByRemovingAll(characters: ["<p>","<b>","</b> ","</p>","</i>","<i>"])
           
            movieDescLabel.text = str
            
        }
        if link != nil {
            let url = URL(string: link ?? "")
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                DispatchQueue.main.async {
                    self.movieImageView.image = UIImage(data: data!)
                }
            }

        }
        if movieTitle != nil {
        movieTitleLabel.text = movieTitle
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        movieImageView.clipsToBounds = false
        movieImageView.layer.cornerRadius = 12
        
    }




}

