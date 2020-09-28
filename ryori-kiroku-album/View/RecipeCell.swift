//
//  RecipeCell.swift
//  ryori-kiroku-album
//
//  Created by Yuya Harada on 2020/09/23.
//  Copyright © 2020 Yuya Harada. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var comment: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureView(recipe: RecipeData){
//        recipeImage.image = image with url
        date.text = recipe.recordedAt
        genre.text = recipe.recipeType
        comment.text = recipe.comment
    }
    
}
