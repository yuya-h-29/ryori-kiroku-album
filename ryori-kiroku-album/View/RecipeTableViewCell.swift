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
    @IBOutlet weak var recipeTypeLabel: UILabel!
    

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
        recipeImageView.setImage(imageUrl: recipe.imageUrl)
        dateLabel.text = recipe.recordedAt
        recipeTypeLabel.text = recipe.recipeType

    }

}
