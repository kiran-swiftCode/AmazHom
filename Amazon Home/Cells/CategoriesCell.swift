//
//  CategoriesCell.swift
//  Amazon Home
//
//  Created by apple on 01/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class CategoriesCell: UITableViewCell {

    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var collectionProduct: ProductsList!
    
    func configure(category:AllProducts,del:ProductOptions?){
            categoryName.text = category.categoryName
            collectionProduct.products = category.products
            collectionProduct.selectionDelegate = del
    }
    
}
