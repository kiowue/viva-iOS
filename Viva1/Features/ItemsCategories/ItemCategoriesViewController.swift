//
//  ItemCategoriesViewController.swift
//  Viva1
//
//  Created by vishwender on 8/23/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import UIKit

class ItemCategoriesViewController: UICollectionViewController {
    struct Constants {
        static let reuseIdentifier = "ItemCategoriesCollectionCell"
        static let itemCategoriesCollectionCell = "ItemCategoriesCollectionCell"
        
        static let itemHeight: CGFloat = 50.0
    }
    // MARK: - Properties
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 40.0, left: 20.0, bottom: 40.0, right: 20.0)
    fileprivate let itemsPerRow: CGFloat = 2
    
    var presenter: ViewPresenterProtocol?
    var contentOrderedSet = NSMutableOrderedSet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = ItemCategoriesViewPresenter(view: self)
        self.presenter?.viewDidLoad()
        self.navigationController?.present(FirebaseTask.sharedInstance.authViewController!, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

//MARK: - UICollectionViewDataSource
extension ItemCategoriesViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //2
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return contentOrderedSet.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        //1
        switch kind {
        //2
        case UICollectionElementKindSectionHeader:
            //3
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: Constants.itemCategoriesCollectionCell,
                                                                             for: indexPath) as! ItemCategoriesCollectionCell
            return headerView
        default:
            //4
            assert(false, "Unexpected element kind")
        }
    }
    
    //3
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as! ItemCategoriesCollectionCell
        
        if let item = contentOrderedSet.object(at: indexPath.row) as? CategoriesDataModel {
            cell.configure(itemName: item.name, image: item.image)
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 moveItemAt sourceIndexPath: IndexPath,
                                 to destinationIndexPath: IndexPath) {
        
//        var sourceResults = searches[(sourceIndexPath as NSIndexPath).section].searchResults
//        let flickrPhoto = sourceResults.remove(at: (sourceIndexPath as NSIndexPath).row)
//
//        var destinationResults = searches[(destinationIndexPath as NSIndexPath).section].searchResults
//        destinationResults.insert(flickrPhoto, at: (destinationIndexPath as NSIndexPath).row)
    }
}

//MARK: - UICollectionViewDelegate
extension ItemCategoriesViewController {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        guard contentOrderedSet.count > indexPath.row else {return}
        let item = contentOrderedSet.object(at: indexPath.row)
        presenter?.showPostDetail(forPost: item)
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didDeselectItemAt indexPath: IndexPath) {
        //
    }
}

extension ItemCategoriesViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: Constants.itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

extension ItemCategoriesViewController: ViewControllerProtocol {
    func showPosts<T>(with posts: [T]) {
        contentOrderedSet = NSMutableOrderedSet(array: posts)
        collectionView?.reloadData()
    }
    
    func showError() {
        //
    }
    
    func showLoading() {
        //
    }
    
    func hideLoading() {
        //
    }
}
