//
//  ProductsList.swift
//  Amazon Home
//
//  Created by apple on 01/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ProductsList: UICollectionView,UICollectionViewDataSource,UICollectionViewDelegate {

    var products = [Product](){
        didSet{
        reloadData()
    }
    }
    
    var selectionDelegate : ProductOptions?
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource =  self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("recount ",products.count)
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
       cell.populateCell(product: products[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            selectionDelegate?.productSelected(product: products[indexPath.row])
        }

}
