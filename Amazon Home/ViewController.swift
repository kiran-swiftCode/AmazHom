//
//  ViewController.swift
//  Amazon Home
//
//  Created by apple on 01/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import PromiseKit
class ViewController: UIViewController,ProductOptions {
    
    
    @IBOutlet weak var tableView: HomeTableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
          let _ =  APIManager.api.getData()
            .done{ products in
                self.tableView.allProducts = products
                self.tableView.selectionDelegate = self
            }

        
    }

    func productSelected(product: Product) {
        print("name: ",product.name)
    }
   

}

