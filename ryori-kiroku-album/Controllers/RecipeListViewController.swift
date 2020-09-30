//
//  RecipeListViewController.swift
//  ryori-kiroku-album
//
//  Created by Yuya Harada on 2020/09/26.
//  Copyright © 2020 Yuya Harada. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class RecipeListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var recipes: [RecipeData] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
        loadRecipes()
    
    }
    
    
    func loadRecipes() {

        AF.request(K.API.cookingRecordsUrl).responseJSON { response in
            
            switch response.result {
            
                case .success(let value):
                    
                    let json = JSON(value)
                    let list: Array<JSON> = json[K.API.Parameters.cookingRecords].arrayValue
                    
                    for cookingRecord in list {
                        
                        let recipeData = RecipeData(recipeType: cookingRecord[K.API.Parameters.recipeType].stringValue, recordedAt: cookingRecord[K.API.Parameters.recordedAt].stringValue, imageUrl: cookingRecord[K.API.Parameters.imageUrl].stringValue, comment: cookingRecord[K.API.Parameters.comment].stringValue)
                        
                        self.recipes.append(recipeData)
                        
                        // reload data to fill the table view
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }

                case .failure(let error):
                    print(error)
            
            }
        }
    }

}


extension RecipeListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return recipes.count
    }
    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let recipe = recipes[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.RecipeList.cell, for: indexPath) as! RecipeTableViewCell
        
        cell.configureView(recipe: recipe)
        
        return cell
    }
    
}

