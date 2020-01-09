//
//  VideoPlatformViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 27/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import UIKit

class VideoPlatformViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(dismissVC), name: NSNotification.Name(rawValue: "dismissVideoPlatform"), object: nil)
        
        setupUI()
    }
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension VideoPlatformViewController {
    
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
