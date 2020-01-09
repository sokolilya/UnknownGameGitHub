//
//  WorkChooseViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 06/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.isHidden = true
        perform(#selector(runTime), with: nil, afterDelay: delay)
        
        NotificationCenter.default.addObserver(self, selector: #selector(animateShopViewsDown), name: NSNotification.Name("AnimateShopViewsDown"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(animateShopViewsUp), name: NSNotification.Name("AnimateShopViewsUp"), object: nil)
        
        setupUI()
        setupTabBar()
        
        buttons.forEach { (b) in
            b.startAnimatingPressActions()
        }
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playerStatusLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var dollarsLabel: UILabel!
    @IBOutlet var viewsCollection: [UIView]!
    @IBAction func toShopButton(_ sender: UIButton) {
        toShop_Name = sender.currentTitle ?? "Button"
        shopIndex = sender.tag
        NotificationCenter.default.post(name: NSNotification.Name("SelectShopName"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name("ChooseStoreData"), object: nil)
    }
    
    @objc func animateShopViewsDown() {
        animate(viewsCollection[shopTag], transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
    }
    
    @objc func animateShopViewsUp() {
        animate(viewsCollection[shopTag], transform: .identity)
    }
    
    private func animate(_ view: UIView, transform: CGAffineTransform) {
    UIView.animate(withDuration: 0.4,
                   delay: 0,
                   usingSpringWithDamping: 0.5,
                   initialSpringVelocity: 3,
                   options: [.curveEaseInOut],
                   animations: {
                    view.transform = transform
        }, completion: nil)
    }
    
}

extension ShopViewController {
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
        NotificationCenter.default.post(name: NSNotification.Name("UpdateShopDollaresLabel"), object: nil)
        perform(#selector(runTime), with: nil, afterDelay: delay)
    }
}

extension ShopViewController {
    
    func setupUI() {
        let modelName = UIDevice.modelName
        
        switch modelName {
        case "iPhone X", "iPhone XS", "iPhone XS Max", "iPhone XR", "iPhone 11", "iPhone 11 Pro", "iPhone 11 Pro Max":
            backgroundImageView.image = UIImage(named: "background_9_11")
        default:
            backgroundImageView.image = UIImage(named: "background_9_8")
        }
    }
    
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
    
}
