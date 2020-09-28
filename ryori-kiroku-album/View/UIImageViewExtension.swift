//
//  UIImageViewExtension.swift
//  ryori-kiroku-album
//
//  Created by Yuya Harada on 2020/09/28.
//  Copyright © 2020 Yuya Harada. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(imageUrl: String) {
        
        self.kf.setImage(with: URL(string: imageUrl))
    
    }
    
}
