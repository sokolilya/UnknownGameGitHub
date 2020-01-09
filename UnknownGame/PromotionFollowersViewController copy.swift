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
    
    var promotionFollowersArr : [Promotion] = []
    
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
        startPromotion(with: sender.tag - 1)
    }
    
}

extension PromotionFollowersViewController {
    
    func setupPromotion(isStreamTV: Bool) {
        var index = 0
        
        for promo in promotion {
            if isStreamTV == promo.isStreamTV && !promo.isPopularity {
                promotionFollowersLabelsCollection[index].text = promo.name
                followersPromotionCollection[index].text = "+\(promo.followers)"
                costPromotionFollowersCollection[index].text = "\(promo.cost) $"
                index += 1
                
                promotionFollowersArr.append(promo)
            }
        }
    }
    
    func startPromotion(with index: Int) {
        if dollars >= promotionFollowersArr[index].cost {
            dollars -= promotionFollowersArr[index].cost
            
            var followers = promotionFollowersArr[index].followers
            var salaryOffset = 0
            
            while followers >= 25 {
                salaryOffset += 1
                followers -= 25
            }
            
            switch isStreamTV {
            case true:
                streamTV.followers += promotionFollowersArr[index].followers
                streamTV.popularity += promotionFollowersArr[index].popularity
                streamTVArr.forEach { (stream) in
                    stream.avgSalary += salaryOffset
                }
                streamTV.avgSalary += salaryOffset
            case false:
                videoPlatform.followers += promotionFollowersArr[index].followers
                videoPlatform.popularity += promotionFollowersArr[index].popularity
                videoPlatformArr.forEach { (video) in
                    video.avgSalary += salaryOffset
                }
                videoPlatform.avgSalary += salaryOffset
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
