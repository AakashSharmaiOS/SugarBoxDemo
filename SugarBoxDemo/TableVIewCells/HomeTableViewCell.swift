//
//  HomeTableViewCell.swift
//  SugarBoxDemo
//
//  Created by IOSTEAM02 on 23/11/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    //MARK: Variables
    var imageStringArr = [Assets]()
    var imageBaseUrl = "https://static01.sboxdc.com/images"
    
    //MARK: Outlets
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var imageCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
}

extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageStringArr.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubBannerCollectionViewCell", for: indexPath) as! SubBannerCollectionViewCell
        cell.picture.makeRounded()
        cell.picture.sd_setImage(with: URL(string: "\(imageBaseUrl)\(imageStringArr[indexPath.row].sourcePath ?? "" )"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.imageCollectionView.frame.size.width/2.5, height: self.imageCollectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
