//
//  ProductCell.swift
//  Amazon Home
//
//  Created by apple on 01/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import AlamofireImage

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImgView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var oldPrice: UILabel!
    
    
    func populateCell(product:Product){
        
        self.productName.text = product.name
        self.productPrice.text = product.price
        let attributedString = NSMutableAttributedString(string: product.olderPrice)
        attributedString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))
        oldPrice.attributedText = attributedString
        if let url = URL(string:product.imgUrl){
        self.productImgView.af_setImage(withURL: url)
    }
    }
    
}
