//
//  ViewController.swift
//  Appstreet Assignment
//
//  Created by abc on 26/08/20.
//  Copyright © 2020 abc. All rights reserved.
//

import UIKit

struct dataModel {
    var image: UIImage
    var imagename: String = ""
}

class ViewController: UIViewController,UISearchBarDelegate,UISearchControllerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
   var arrData = [dataModel]()
   let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
       // collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        searchBarSetup()
        dataModelSetup()
    }
    
    
    private func dataModelSetup(){
    
        arrData = [dataModel(image: #imageLiteral(resourceName: "Apple images"), imagename: "Apple images"),dataModel(image: #imageLiteral(resourceName: "Avatar"), imagename: "Avatar"),dataModel(image: #imageLiteral(resourceName: "Firefox"), imagename: "Firefox"),dataModel(image: #imageLiteral(resourceName: "Linkedin"), imagename: "Linkedin"),dataModel(image: #imageLiteral(resourceName: "Cloud download"), imagename: "Download"),  dataModel(image: #imageLiteral(resourceName: "Server"), imagename: "Server"),dataModel(image: #imageLiteral(resourceName: "Portrait"), imagename: "Portrait"),dataModel(image: #imageLiteral(resourceName: "Imo"), imagename: "Imo"),dataModel(image: #imageLiteral(resourceName: "Google pie"), imagename: "Google pie"),dataModel(image: #imageLiteral(resourceName: "Server busy"), imagename: "Server busy"),dataModel(image: #imageLiteral(resourceName: "Icon"), imagename: "Icon"),dataModel(image: #imageLiteral(resourceName: "Burger icon"), imagename: "Burger icon"),dataModel(image: #imageLiteral(resourceName: "Chrome"), imagename: "Chrome"),dataModel(image: #imageLiteral(resourceName: "Google"), imagename: "Google"), dataModel(image: #imageLiteral(resourceName: "Call"), imagename: "Call"),dataModel(image: #imageLiteral(resourceName: "Open camera"), imagename: "Open camera"),dataModel(image: #imageLiteral(resourceName: "Whatsapp"), imagename: "Whatsapp"),dataModel(image: #imageLiteral(resourceName: "Google search new"), imagename: "Google icon"), dataModel(image: #imageLiteral(resourceName: "Instagram"), imagename: "Instagram"),dataModel(image: #imageLiteral(resourceName: "Camera"), imagename:  "Camera"), dataModel(image: #imageLiteral(resourceName: "Play"), imagename: "Play"),dataModel(image: #imageLiteral(resourceName: "Material icon"), imagename: "Material icon"),dataModel(image: #imageLiteral(resourceName: "Text"), imagename: "Text"),dataModel(image: #imageLiteral(resourceName: "Code"), imagename: "Code"),dataModel(image: #imageLiteral(resourceName: "Google old"), imagename: "Googleold"),dataModel(image: #imageLiteral(resourceName: "Spotify"), imagename: "Spotify"),dataModel(image: #imageLiteral(resourceName: "Safari"), imagename: "Safari"),dataModel(image: #imageLiteral(resourceName: "Search"), imagename: "Search"),dataModel(image: #imageLiteral(resourceName: "Twitter"), imagename: "Twitter classic"),dataModel(image: #imageLiteral(resourceName: "India map"), imagename: "India map")]

    }
    private func searchBarSetup(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
}

extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {return}
        if searchText == ""{
            dataModelSetup()
        }else{
            dataModelSetup()
            arrData = arrData.filter{
                $0.imagename.contains(searchText)
            }
        }
        collectionView.reloadData()
    }
    
   
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.img.image = arrData[indexPath.row].image
        print(arrData[indexPath.row].imagename)
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
