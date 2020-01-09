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
    
    var promotionPopularityArr : [Promotion] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupPromotion(isStreamTV: isStreamTV)
    }
    
    @IBOutlet var promotionPopularityLabelCollection: [UILabel]!
    @IBOutlet var promotionPopulaityCollection: [UILabel]!
    @IBOutlet var costPromotionPopularityCollection: [UILabel]!
    
    @IBAction func promotionPopularityLabelButtonAction(_ sender: UIButton) {
        promotionPopularityBioButtonAction(sender)
    }
    
    @IBAction func promotionPopularityBioButtonAction(_ sender: UIButton) {
        startPromotion(with: sender.tag - 1)
    }
    
    
}

extension PromotionPopularityViewController {
    
    func setupPromotion(isStreamTV: Bool) {
        var index = 0
        
        for promo in promotion {
            if isStreamTV == promo.isStreamTV && promo.isPopularity {
                promotionPopularityLabelCollection[index].text = promo.name
                promotionPopulaityCollection[index].text = "+\(promo.popularity)"
                costPromotionPopularityCollection[index].text = "\(promo.cost) $"
                index += 1
                
                promotionPopularityArr.append(promo)
            }
        }
    }
    
    func startPromotion(with index: Int) {
        if dollars >= promotionPopularityArr[index].cost {
            dollars -= promotionPopularityArr[index].cost
            
            switch isStreamTV {
            case true:
                streamTV.popularity += promotionPopularityArr[index].popularity
            case false:
                videoPlatform.popularity += promotionPopularityArr[index].popularity
            }
        } else {
            print("No money!!!")
        }
        
        let encodedStreamData : Data = NSKeyedArchiver.archivedData(withRootObject: streamTV)
        UserDefaults.standard.set(encodedStreamData, forKey: "StreamTV")
        
        let encodedVideoData : Data = NSKeyedArchiver.archivedData(withRootObject: videoPlatform)
        UserDefaults.standard.set(encodedVideoData, forKey: "VideoPlatform")
    }
    
}
