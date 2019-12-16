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
        updateLabels()
    }
    
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
