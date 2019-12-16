//
//  PlayerViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 06/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.isHidden = true
        perform(#selector(runTime), with: nil, afterDelay: delay)
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playerStatusLabel: UILabel!
    
}

extension PlayerViewController {
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
        perform(#selector(runTime), with: nil, afterDelay: delay)
    }
}
