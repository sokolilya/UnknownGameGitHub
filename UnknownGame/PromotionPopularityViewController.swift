//
//  PromotionPopularityViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 12.12.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit

class PromotionPopularityViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet var promotionPopularityLabelCollection: [UILabel]!
    @IBOutlet var promotionPopulaityCollection: [UILabel]!
    @IBOutlet var costPromotionPopularityCollection: [UILabel]!
    
    @IBAction func promotionPopularityLabelButtonAction(_ sender: Any) {
        promotionPopularityBioButtonAction(sender)
    }
    
    @IBAction func promotionPopularityBioButtonAction(_ sender: Any) {
        
    }
    
    
}
