//
//  RecipeTableViewCell.swift
//  ryori-kiroku-album
//
//  Created by Yuya Harada on 2020/09/30.
//  Copyright © 2020 Yuya Harada. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var commnetLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var recipeTypeImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureView(recipe: RecipeData){
        
        commnetLabel.text = recipe.comment
        commnetLabel.font = commnetLabel.font.withSize(20)
        recipeImageView.setRecipeImage(imageUrl: recipe.imageUrl)
        dateLabel.text = setTemplate(strDate: recipe.recordedAt)
        dateLabel.textColor = .gray
        recipeTypeImageView.image = UIImage(named: recipe.recipeType)
        

    }

}

extension RecipeTableViewCell {
    
    func setTemplate (strDate: String) -> String {
        
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ydMMM", options: 0, locale: Locale(identifier: "ja_JP"))
        
        let result = dateFormatter.string(from: Date())
        
        return result
    }

    
}
