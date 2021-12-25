//
//  HomeViewController.swift
//  iOS-Task Swift
//
//  Created by John Doe on 2021-12-25.
//

import UIKit

class HomeViewController: UIViewController {
    let offWhite = UIColor(displayP3Red: 225/255, green: 224/255, blue: 224/255, alpha: 100/255)
    let cyan = UIColor(displayP3Red: 100/255, green: 172/255, blue: 181/255, alpha: 100/255)
    @IBOutlet weak var collectionView: UICollectionView!
    var data: Films? 
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        registCell()
        print("data arrive \(data)")
//        backgroundColor = .darkGray
        collectionView.backgroundColor = offWhite
        view.backgroundColor = offWhite
        // Do any additional setup after loading the view.
    }
    func registCell(){
        collectionView.register(UINib.init(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }



}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.config(index: indexPath.row)
        
    return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 8, height: collectionView.frame.height / 3 - 8)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Hey , \(indexPath.row)")
    }
    
    
    
}
