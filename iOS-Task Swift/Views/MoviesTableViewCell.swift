//
//  MoviesTableViewCell.swift
//  iOS-Task Swift
//
//  Created by John Doe on 2021-12-25.
//

import UIKit
import Cosmos
class MoviesTableViewCell: UITableViewCell {
    let offWhite = UIColor(displayP3Red: 225/255, green: 224/255, blue: 224/255, alpha: 100/255)
    let cyan = UIColor(displayP3Red: 100/255, green: 172/255, blue: 181/255, alpha: 100/255)
    override open var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 10
            frame.origin.x += 10
            frame.size.height -= 15
            frame.size.width -= 2 * 10
            super.frame = frame
        }
    }
    @IBOutlet weak var premieredLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var watchNowButton: UIButton!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    let firstColor = UIColor(displayP3Red: 7/255, green: 167/255, blue: 224/255, alpha: 100/255)
    let secondColor = UIColor(displayP3Red: 7/255, green: 200/255, blue: 165/255, alpha: 100/255)
    override func awakeFromNib() {
        super.awakeFromNib()
        watchNowButton.addTarget(self, action: #selector(linkTapped), for: .touchUpInside)
        ratingView.isUserInteractionEnabled = false
        ratingView.settings.fillMode = .half
        // Initialization code
    }
    override func layoutSubviews() {
        contentView.clipsToBounds = false
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = offWhite
        movieImageView.layer.masksToBounds = true
        movieImageView.layer.cornerRadius = 8
        ratingView.backgroundColor = .clear
        watchNowButton.applyGradient(colours: [firstColor , secondColor])
        watchNowButton.layer.cornerRadius = 16
        
        super.layoutSubviews()
    }
    @objc func linkTapped(){
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension UIView {

    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }


    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 1)
        return gradient
    }
}
