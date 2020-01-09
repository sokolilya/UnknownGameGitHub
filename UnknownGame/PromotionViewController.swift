//
//  PromotionViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 12.11.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit

class PromotionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension PromotionViewController {
    
    func setupUI() {
        let modelName = UIDevice.modelName
        print(modelName)
        
        switch modelName {
        case "iPhone X", "iPhone XS", "iPhone XS Max", "iPhone XR", "iPhone 11", "iPhone 11 Pro", "iPhone 11 Pro Max":
            backgroundImage.image = UIImage(named: "background_4_11")
        default:
            backgroundImage.image = UIImage(named: "background_4_8")
        }
    }
    
}

