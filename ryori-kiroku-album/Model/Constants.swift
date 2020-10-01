//
//  Constants.swift
//  ryori-kiroku-album
//
//  Created by Yuya Harada on 2020/09/27.
//  Copyright © 2020 Yuya Harada. All rights reserved.
//

import Foundation


struct K {
    
    struct API {
        
        static let cookingRecordsUrl = "https://cooking-records.herokuapp.com/cooking_records?offset="
        
        struct Parameters {
            
            static let cookingRecords = "cooking_records"
            
            static let imageUrl = "image_url"
            
            static let comment = "comment"
            
            static let recipeType = "recipe_type"
            
            static let recordedAt = "recorded_at"
        }
        
    }
    
    struct RecipeList {
        
        static let cell = "RecipeCell"
        
    }
    

}
