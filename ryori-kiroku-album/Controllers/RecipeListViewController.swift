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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request("https://cooking-records.herokuapp.com/cooking_records").responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                
                let list: Array<JSON> = json["cooking_records"].arrayValue
                
                let imageUrlArr = list.map{$0["image_url"].stringValue}
                
                let commentArr = list.map{$0["comment"].stringValue}
                
                let recipeTypeArr = list.map{$0["recipe_type"].stringValue}
                
                let dateArr = list.map{$0["recorded_at"].stringValue}
                
                debugPrint(imageUrlArr)
                debugPrint(commentArr)
                debugPrint(recipeTypeArr)
                debugPrint(dateArr)
                
                
            case .failure(let error):
                print(error)
            }
        }
        
        


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
