//
//  PlayerViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 06/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.isHidden = true
        perform(#selector(runTime), with: nil, afterDelay: delay)
        
        NotificationCenter.default.addObserver(self, selector: #selector(changePlaceholderImage), name: NSNotification.Name("changePlaceHolderImage"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changePlaceholderBackgroundImage), name: NSNotification.Name("changePlaceHolderBackgroundImage"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(savePlayerProfile), name: NSNotification.Name("SavePlayerProfile"), object: nil)
        
        setupUI()
        setupTabBar()
    }
    
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var placeholderView: UIView!
    @IBOutlet weak var placeholderBackgroundImageView: UIImageView!
    @IBOutlet weak var placeholderImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playerStatusLabel: UILabel!
    @IBOutlet weak var dollarsLabel: UILabel!
    @IBOutlet weak var statusImageView: UIImageView!
    
    func setupUI() {
        
        placeholderImageView.image = UIImage(named: player.image)
        
        placeholderBackgroundImageView.image = UIImage(named: player.imageBackground)
        placeholderBackgroundImageView.layer.cornerRadius = 10.0
        
        let modelName = UIDevice.modelName
        
        switch modelName {
        case "iPhone X", "iPhone XS", "iPhone XS Max", "iPhone XR", "iPhone 11", "iPhone 11 Pro", "iPhone 11 Pro Max":
            backgroundImageView.image = UIImage(named: "background_7_11")
        default:
            backgroundImageView.image = UIImage(named: "background_7_8")
        }
    }
}

extension ProfileViewController {
    @objc func runTime() {
        //mm += 1
//        if mm == 60 {
//            hh += 1
//            mm = 0
//        }
//        if mm % statusTimeEdge == 0 && playerStatus > 0 {
//            playerStatus -= 1
//        }
//        if hh == 24 {
//            hh = 0
//            ddIndex += 1
//        }
//        if hh == workEndTime && mm == 0 && hasWork {
//            dollars += salary
//            print(dollars)
//        }
//        if ddIndex == 7 {
//            ddIndex = 0
//        }
        updateTime()
    }
    
    func updateTime() {
        if mm < 10 {
            timeLabel.text = String(hh) + ":" + "0" + String(mm) + " " + ddArr[ddIndex]
        } else if mm >= 10 {
            timeLabel.text = String(hh) + ":" + String(mm) + " " + ddArr[ddIndex]
        }
        playerStatusLabel.text = String(playerStatus) + "%"
        dollarsLabel.text = String(dollars) + "$"
        perform(#selector(runTime), with: nil, afterDelay: delay)
    }
    
}

extension ProfileViewController {
    
    func setupTabBar() {
        if let tabBarViewSelf = Bundle.main.loadNibNamed("TabBarView", owner: self, options: nil)?.first as? TabBarView {
            
            NotificationCenter.default.addObserver(self, selector: #selector(animateTabBarDown), name: NSNotification.Name(rawValue: "AnimateTabBar_Down"), object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(animateTabBarUp), name: NSNotification.Name(rawValue: "AnimateTabBar_Up"), object: nil)
            
            let modelName = UIDevice.modelName
            
            switch modelName {
            case "iPhone X", "iPhone XS", "iPhone XS Max", "iPhone XR", "iPhone 11", "iPhone 11 Pro", "iPhone 11 Pro Max":
                self.tabBarView.addSubview(tabBarViewSelf)
                self.view.constraints.forEach { (c) in
                    if c.identifier == "tabBarBottom" {
                        c.constant = 32
                    }
                }
                self.tabBarView.layoutIfNeeded()
            default:
                self.tabBarView.addSubview(tabBarViewSelf)
            }
        }
        
    }
    
    @objc func animateTabBarDown() {
        UIView.animate(withDuration: 0.3, animations: {
            self.tabBarView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { (_) in
            UIView.animate(withDuration: 0.3) {
                self.tabBarView.transform = CGAffineTransform.identity
            }
        }
    }
    
    @objc func animateTabBarUp() {
        UIView.animate(withDuration: 0.3, animations: {
            self.tabBarView.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }, completion: { (_) in
            UIView.animate(withDuration: 0.1) {
                if currentVC != destinationVC {
                    self.tabBarView.transform = CGAffineTransform.identity
                }
            }
        })
    }
    
    @objc func changePlaceholderImage() {
        player.image = placeholderImages[placeholderImageIndex]
        placeholderImageView.image = UIImage(named: player.image)
        placeholderImageIndex = -1
        NotificationCenter.default.post(name: NSNotification.Name("SavePlayerProfile"), object: nil)
    }
    
    @objc func changePlaceholderBackgroundImage() {
        player.imageBackground = placeholderBackgroundImages[placeholderBackgroundImageIndex]
        placeholderBackgroundImageView.image = UIImage(named: player.imageBackground)
        placeholderBackgroundImageIndex = -1
        NotificationCenter.default.post(name: NSNotification.Name("SavePlayerProfile"), object: nil)
    }
    
    @objc func savePlayerProfile() {
        let encodedProfile = NSKeyedArchiver.archivedData(withRootObject: player)
        UserDefaults.standard.set(encodedProfile, forKey: "ProfileData")
    }
    
}
