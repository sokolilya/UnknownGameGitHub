//
//  StableWorkViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 10/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit

class StableWorkViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateWork), name: NSNotification.Name(rawValue: "updateWork"), object: nil)
        
        setupUI()
        updateLabels()
    }
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var workStatusLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var workMasteryLabel: UILabel!
    @IBOutlet weak var officeHoursLabel: UILabel!
    @IBOutlet weak var searchJobOutlet: UIButton!
    @IBOutlet weak var quitWorkOutlet: UIButton!
    @IBOutlet weak var backOutlet: UIButton!
    @IBAction func searchJobAction(_ sender: Any) {
        
    }
    
    @IBAction func quitJobAction(_ sender: Any) {
        hasWork = false
        salary = 0
        workPoints = 0
        updateLabels()
        
        UserDefaults.standard.set(workName, forKey: "workName")
        UserDefaults.standard.set(hasWork, forKey: "hasWork")
        UserDefaults.standard.set(isAtNight, forKey: "isAtNight")
        
        UserDefaults.standard.set(salary, forKey: "salary")
        UserDefaults.standard.set(workStartTime, forKey: "workStartTime")
        UserDefaults.standard.set(workEndTime, forKey: "workEndTime")
        UserDefaults.standard.set(workPoints, forKey: "workPoints")
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateLabels() {
        if hasWork {
            workStatusLabel.text = workName
            salaryLabel.text = String(salary + workMasteryLevel * salary / 10) + "$"
            workMasteryLabel.text = String(workMasteryLevel)
            officeHoursLabel.text = String(workStartTime) + "..." + String(workEndTime) + " Mon...Fri"
        } else if !hasWork {
            workStatusLabel.text = noWork
            salaryLabel.text = "..."
            officeHoursLabel.text = "..."
            workMasteryLabel.text = "..."
        }
    }
    
    @objc func updateWork() {
        workStatusLabel.text = workName
        salaryLabel.text = String(salary + workMasteryLevel * salary / 10) + "$"
        workMasteryLabel.text = String(workMasteryLevel)
        officeHoursLabel.text = String(workStartTime) + "..." + String(workEndTime) + " Mon...Fri"
    }
    
}

extension StableWorkViewController {
    
    func setupUI() {
        let modelName = UIDevice.modelName
        print(modelName)
        
        switch modelName {
        case "iPhone X", "iPhone XS", "iPhone XS Max", "iPhone XR", "iPhone 11", "iPhone 11 Pro", "iPhone 11 Pro Max":
            backgroundImage.image = UIImage(named: "background_2_11")
        default:
            backgroundImage.image = UIImage(named: "background_2_8")
        }
    }
    
}
