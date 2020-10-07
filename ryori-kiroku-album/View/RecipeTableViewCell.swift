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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

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



// change to yyyy年MM月dd日 format
extension RecipeTableViewCell {
    
    func setTemplate (strDate: String) -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = .init(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let date = dateFormatter.date(from: strDate)!
        
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ydMMM", options: 0, locale: Locale(identifier: "ja_JP"))
        
        return dateFormatter.string(from: date)
        
    }

    
}
