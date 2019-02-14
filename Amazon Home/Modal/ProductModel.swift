//
//  ProductModel.swift
//  Amazon Home
//
//  Created by apple on 01/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import SwiftyJSON


protocol  ProductOptions {
    func productSelected(product:Product)
}

class AllProducts{
    
    var categoryName = String()
    var products = [Product]()
    
    init(res:JSON,key:String){
        
        categoryName = key
        print("please ",res)
        for item in res.arrayValue{
            let product = Product(res: item)
            products.append(product)
        }
        
    }
}

class Product{
    
    var name = String()
    var price = String()
    var olderPrice = String()
    var imgUrl = String()
    
    init(res:JSON){
        name = res["name"].stringValue
        olderPrice = res["real_price"].stringValue
        price = res["price"].stringValue
        imgUrl = res["img"].stringValue
    }
    
}
