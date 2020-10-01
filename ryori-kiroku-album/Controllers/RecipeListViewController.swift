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
    var offset: Int = 0
    var isPaginating: Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.delegate = self
        
        loadRecipes()
    
    }
    
    
    func loadRecipes() {
        
        // start pagination process
        isPaginating = true

        
        // fetch data from api endpoint
        AF.request(K.API.cookingRecordsUrl + "\(offset)").responseJSON { response in
            
            switch response.result {
            
                case .success(let value):
                    
                    let json = JSON(value)
                    let list: Array<JSON> = json[K.API.Parameters.cookingRecords].arrayValue
                    
                    
                    // change the offset integer
                    self.offset += list.count
                   
                    
                    for cookingRecord in list {
                        
                        let recipeData = RecipeData(recipeType: cookingRecord[K.API.Parameters.recipeType].stringValue, recordedAt: cookingRecord[K.API.Parameters.recordedAt].stringValue, imageUrl: cookingRecord[K.API.Parameters.imageUrl].stringValue, comment: cookingRecord[K.API.Parameters.comment].stringValue)
                        
                        self.recipes.append(recipeData)
                        
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                        // end pagination process
                        self.isPaginating = false
                        
                    }

                case .failure(let error):
                    print(error)
            
            }
        }
    }

}


extension RecipeListViewController: UITableViewDataSource, UIScrollViewDelegate, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return recipes.count
    }
    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let recipe = recipes[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.RecipeList.cell, for: indexPath) as! RecipeTableViewCell
        
        cell.configureView(recipe: recipe)
        
        return cell
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let position = scrollView.contentOffset.y
        
        if position > (tableView.contentSize.height - 100 - scrollView.frame.size.height) {
            
            
            // if pagination is started, do nothing
            guard (!isPaginating ) else {
                return
            }
            
            self.loadRecipes()
            
        }
    }
    

     
    
}

