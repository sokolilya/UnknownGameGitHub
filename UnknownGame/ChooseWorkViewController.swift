//
//  ChooseWorkViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 13/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit

class ChooseWorkViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(dismissVC), name: NSNotification.Name(rawValue: "dismissChooseWork"), object: nil)
    }
        
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissVC() {
        
        UserDefaults.standard.set(workName, forKey: "workName")
        UserDefaults.standard.set(hasWork, forKey: "hasWork")
        UserDefaults.standard.set(isAtNight, forKey: "isAtNight")
        
        UserDefaults.standard.set(salary, forKey: "salary")
        UserDefaults.standard.set(workStartTime, forKey: "workStartTime")
        UserDefaults.standard.set(workEndTime, forKey: "workEndTime")
        UserDefaults.standard.set(workPoints, forKey: "workPoints")
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
