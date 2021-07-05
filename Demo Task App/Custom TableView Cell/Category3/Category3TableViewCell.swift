//
//  Category1TableViewCell.swift
//  Demo Task App
//
//  Created by apple on 04/07/21.
//

import UIKit

class Category3TableViewCell: UITableViewCell,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    @IBOutlet weak var linkCollectionView: UICollectionView!
 
    var linkArray = [String]()


    override func awakeFromNib() {
        super.awakeFromNib()
        self.linkArray = ["Link 1", "Link 2", "Link 3","Link 4"]
        linkCollectionView.register(UINib(nibName: "LinkCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LinkCollectionViewCell")
        linkCollectionView.delegate =  self
        linkCollectionView.dataSource =  self
        // Initialization code
    }
    
    //UICollectionview delegate methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LinkCollectionViewCell", for: indexPath) as! LinkCollectionViewCell
        cell.title.text = (self.linkArray[indexPath.row] )
            
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0) //.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80 , height: 100)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
