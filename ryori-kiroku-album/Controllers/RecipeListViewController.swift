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
        
        AF.request(K.API.cookingRecordsUrl).responseJSON { response in
            
            switch response.result {
            
                case .success(let value):
                    
                    let json = JSON(value)
                    let list: Array<JSON> = json[K.API.Parameters.cookingRecords].arrayValue
                
//                let imageUrlArr = list.map{$0[K.API.Parameters.imageUrl].stringValue}
//                let commentArr = list.map{$0[K.API.Parameters.comment].stringValue}
//                let recipeTypeArr = list.map{$0[K.API.Parameters.recipeType].stringValue}
//                let dateArr = list.map{$0[K.API.Parameters.recordedAt].stringValue}
//                debugPrint(imageUrlArr, commentArr, recipeTypeArr, dateArr)

                    debugPrint(list)
                
                
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
