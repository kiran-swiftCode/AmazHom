//
//  HomeTableView.swift
//  Amazon Home
//
//  Created by apple on 01/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class HomeTableView: UITableView,UITableViewDelegate,UITableViewDataSource {
    
    var allProducts = [AllProducts](){
        didSet{
            reloadData()
        }
    }
    var selectionDelegate : ProductOptions?
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProducts.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        if row == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: "OverviewCell") as! OverviewCell
        return cell
        }else{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell") as! CategoriesCell
            cell.configure(category: allProducts[indexPath.row-1],del:selectionDelegate)
        return cell
        }
    }

}
