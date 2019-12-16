//
//  ChooseWorkChildViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 13/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit

class ChooseWorkChildViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        updateLabels()
    }
    
    @IBOutlet var workViews: [UIView]!
    @IBOutlet var workNameLabels: [UILabel]!
    @IBOutlet var workSalaryLabels: [UILabel]!
    @IBOutlet var workHoursLabels: [UILabel]!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func firstWorkButtonAction(_ sender: Any) {
        salary = workSalaryArr[0]
        workMasteryLevel = 0
        workStartTime = workStartTimeArr[0]
        workEndTime = workEndTimeArr[0]
        workName = workNameArr[0]
        hasWork = true
        isAtNight = false
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "dismissChooseWork"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateWork"), object: nil)
    }
    
    @IBAction func secondWorkButtonAction(_ sender: Any) {
        salary = workSalaryArr[1]
        workMasteryLevel = 0
        workStartTime = workStartTimeArr[1]
        workEndTime = workEndTimeArr[1]
        workName = workNameArr[1]
        hasWork = true
        isAtNight = false
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "dismissChooseWork"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateWork"), object: nil)
    }
    
    @IBAction func thirdWorkButtonAction(_ sender: Any) {
        salary = workSalaryArr[2]
        workMasteryLevel = 0
        workStartTime = workStartTimeArr[2]
        workEndTime = workEndTimeArr[2]
        workName = workNameArr[2]
        hasWork = true
        isAtNight = false
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "dismissChooseWork"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateWork"), object: nil)
    }
    
    @IBAction func forthWorkButtonAction(_ sender: Any) {
        salary = workSalaryArr[3]
        workMasteryLevel = 0
        workStartTime = workStartTimeArr[3]
        workEndTime = workEndTimeArr[3]
        workName = workNameArr[3]
        hasWork = true
        isAtNight = false
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "dismissChooseWork"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateWork"), object: nil)
    }
    
    @IBAction func fifthWorkButtonAction(_ sender: Any) {
        salary = workSalaryArr[4]
        workMasteryLevel = 0
        workStartTime = workStartTimeArr[4]
        workEndTime = workEndTimeArr[4]
        workName = workNameArr[4]
        hasWork = true
        isAtNight = true
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "dismissChooseWork"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateWork"), object: nil)
    }
    
    func updateLabels() {
        for index in 0..<workSalaryArr.count {
            workSalaryLabels[index].text = String(workSalaryArr[index])
            if isAtNight {
                workHoursLabels[index].text = String(workEndTimeArr[index]) + "..." + String(workStartTimeArr[index]) + "Mon...Fri"
            } else {
                workHoursLabels[index].text = String(workStartTimeArr[index]) + "..." + String(workEndTimeArr[index]) + "Mon...Fri"
            }
        }
    }
    
}
