//
//  HomeCollectionViewCell.swift
//  iOS-Task Swift
//
//  Created by John Doe on 2021-12-25.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    let cyan = UIColor(displayP3Red: 100/255, green: 172/255, blue: 223/255, alpha: 100/255)
    @IBOutlet weak var titleCellLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.backgroundColor = cyan
        titleCellLabel.textColor = .white
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        mainView.clipsToBounds = false
        mainView.layer.cornerRadius = 8
    }
    func config(index: Int){
        switch index {
        case 0 :
            titleCellLabel.text = "Show name"
        case 1 :
            titleCellLabel.text = "Show Image"
        case 2 :
            titleCellLabel.text = "Show Rate"
        case 3 :
            titleCellLabel.text = "Show Link"
        case 4 :
            titleCellLabel.text = "Show RunTime"
        case 5 :
            titleCellLabel.text = "Show Premiered"
        default :
            break
        }
    }

}
