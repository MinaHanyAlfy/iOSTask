//
//  MoviesTableViewCell.swift
//  iOS-Task Swift
//
//  Created by John Doe on 2021-12-25.
//

import UIKit

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
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.clipsToBounds = false
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = offWhite
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
