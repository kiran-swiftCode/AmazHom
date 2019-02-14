//
//  APIManager.swift
//  Amazon Home
//
//  Created by apple on 14/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import PromiseKit
import SwiftyJSON



class APIManager {
    
    static let api = APIManager()
    private init(){}
    
    func getData()->Promise<[AllProducts]>{
        return Promise(){
            resolver in
            Alamofire.request("http://demo8950097.mockable.io/hello").responseJSON{
                response in
                switch(response.result){
                case .success(let data):
                    print(data)
                    
                    let jsonResponse = JSON(data)
                    var products = [AllProducts]()
                    
                    for (key,subJson):(String, JSON) in jsonResponse {
                        let product = AllProducts(res: subJson,key: key)
                        products.append(product)
                    }
                resolver.fulfill(products)
                case .failure(let error):
                   resolver.reject(error)
                }
            }
        }
    }
}

