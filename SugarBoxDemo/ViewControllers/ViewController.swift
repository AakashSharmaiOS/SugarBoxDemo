//
//  ViewController.swift
//  SugarBoxDemo
//
//  Created by IOSTEAM02 on 23/11/23.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    //MARK: Variables
    var homeViewModel = HomeViewModel()
    var homeData = HomeModel()
    var imageBaseUrl = "https://static01.sboxdc.com/images"
    
    //MARK: Outlets
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var homeTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.getHomeData()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.refreshViewContent()
    }
    
    //MARK: Functions
    func getHomeData(){
        homeViewModel.getHomeData { data, error in
            if error == nil {
                if let value = data {
                    self.homeData = value
                    self.refreshViewContent()
                }
            } else {
                //We can show alert and error msg here!
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    func refreshViewContent() {
        DispatchQueue.main.async {
            self.bannerCollectionView.reloadData()
            self.homeTableView.reloadData()
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeData.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        let dict = self.homeData.data?[indexPath.row]
        cell.headerLabel.text = dict?.title
        for i in dict?.contents ?? [Contents]() {
            let arr = i.assets?.filter({$0.assetType == "IMAGE"}) ?? [Assets]()
            cell.imageStringArr.append(contentsOf: arr)
        }
        cell.imageCollectionView.delegate = cell
        cell.imageCollectionView.dataSource = cell
        cell.imageCollectionView.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.homeTableViewHeight.constant = self.homeTableView.contentSize.height
        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.pageControl.numberOfPages = self.homeData.data?[0].contents?[0].assets?.count ?? 0
        return self.homeData.data?[0].contents?[0].assets?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
        let dict = self.homeData.data?[0].contents?[0].assets
        let imageString = dict?[indexPath.row].sourcePath
        cell.picture.makeRounded()
        cell.picture.sd_setImage(with: URL(string: "\(imageBaseUrl)\(imageString ?? "")"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bannerCollectionView.frame.width, height: self.bannerCollectionView.frame.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

//For now i have written this code here but we can write this in utilities class
extension UIImageView {
    func makeRounded() {
        layer.masksToBounds = false
        layer.cornerRadius = 5
        clipsToBounds = true
    }
}
