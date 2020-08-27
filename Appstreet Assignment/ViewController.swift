//
//  ViewController.swift
//  Appstreet Assignment
//
//  Created by abc on 26/08/20.
//  Copyright © 2020 abc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
   var arrData = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrData = [#imageLiteral(resourceName: "windows 10"),#imageLiteral(resourceName: "avatar"),#imageLiteral(resourceName: "firefox"),#imageLiteral(resourceName: "linkedin"),#imageLiteral(resourceName: "download"),#imageLiteral(resourceName: "server"),#imageLiteral(resourceName: "portrait"),#imageLiteral(resourceName: "imo"),#imageLiteral(resourceName: "google pie"),#imageLiteral(resourceName: "server busy"),#imageLiteral(resourceName: "icon"),#imageLiteral(resourceName: "burger icon"),#imageLiteral(resourceName: "chrome"),#imageLiteral(resourceName: "apple images"),#imageLiteral(resourceName: "call"),#imageLiteral(resourceName: "open camera"),#imageLiteral(resourceName: "whatsapp"),#imageLiteral(resourceName: "google icon"),#imageLiteral(resourceName: "instagram"),#imageLiteral(resourceName: "camera"),#imageLiteral(resourceName: "play"),#imageLiteral(resourceName: "material icon"),#imageLiteral(resourceName: "text"),#imageLiteral(resourceName: "code"),#imageLiteral(resourceName: "googleold"),#imageLiteral(resourceName: "spotify"),#imageLiteral(resourceName: "safari"),#imageLiteral(resourceName: "search"),#imageLiteral(resourceName: "twitter classic"),#imageLiteral(resourceName: "india map")]    }
    
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.img.image = arrData[indexPath.row]
        print(arrData[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        return CGSize(width: collectionWidth/3 - 2, height: collectionWidth/3 - 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
