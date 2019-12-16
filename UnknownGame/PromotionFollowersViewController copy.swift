//
//  PromotionChildViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 12.11.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit

class PromotionFollowersViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupPromotion(isStreamTV: isStreamTV)
    }
    
    @IBOutlet var promotionFollowersLabelsCollection: [UILabel]!
    @IBOutlet var followersPromotionCollection: [UILabel]!
    @IBOutlet var costPromotionFollowersCollection: [UILabel]!
    
    @IBAction func promotionFollowersLabelButtonAction(_ sender: UIButton) {
        promotionFollowersBioButtonAction(sender)
    }
    
    @IBAction func promotionFollowersBioButtonAction(_ sender: UIButton) {
        
    }
    
}

extension PromotionFollowersViewController {
    
    func setupPromotion(isStreamTV: Bool) {
        var index = 0
        
        print(isStreamTV)
        for promo in promotion {
            if isStreamTV == promo.isStreamTV && !promo.isPopularity {
                promotionFollowersLabelsCollection[index].text = promo.name
                followersPromotionCollection[index].text = "+\(promo.followers)"
                costPromotionFollowersCollection[index].text = "\(promo.cost) $"
                index += 1
            }
            
        }
        
    }
    
}
