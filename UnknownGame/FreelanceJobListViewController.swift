//
//  FreelanceJobListViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 12/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit

class FreelanceJobListViewController: UIViewController {
    
    @IBOutlet var buttonsForDisableOutlet: [UIButton]!
    
    var freelanceSwitchCase = 0
    
    var hourly: [Job] = []
    var fixedPrice: [Job] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectCase()
    }
    
    @IBOutlet var fixedPriceViews: [UIView]!
    @IBOutlet var fixedPriceJobNameLabels: [UILabel]!
    @IBOutlet var fixedPriceJobSalaryLabel: [UILabel]!
    @IBOutlet weak var fixedPriceNoJobLabel: UILabel!
    @IBAction func firstFixedPriceButtonAction(_ sender: Any) {
        freelanceTime = 0
        freelanceSalary = fixedPrice[0].salary
        jobDeadline = fixedPrice[0].deadline
        hasFreelance = true
        isHourly = false
        isFirstAnimate = true
        deleteFromArr(fixedPriceBool: true, at: 0)
        saveFreelance()
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func secondFixedPriceButtonAction(_ sender: Any) {
        freelanceTime = 0
        freelanceSalary = fixedPrice[1].salary
        jobDeadline = fixedPrice[1].deadline
        hasFreelance = true
        isHourly = false
        isFirstAnimate = true
        deleteFromArr(fixedPriceBool: true, at: 1)
        saveFreelance()
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func thirdFixedPriceButtonAction(_ sender: Any) {
        freelanceTime = 0
        freelanceSalary = fixedPrice[2].salary
        jobDeadline = fixedPrice[2].deadline
        hasFreelance = true
        isHourly = false
        isFirstAnimate = true
        deleteFromArr(fixedPriceBool: true, at: 2)
        saveFreelance()
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBOutlet var hourlyViews: [UIView]!
    @IBOutlet var hourlyJobNameLabels: [UILabel]!
    @IBOutlet var hourlyJobSalaryLabels: [UILabel]!
    @IBOutlet weak var hourlyNoJobLabel: UILabel!
    @IBAction func firstHourlyButtonAction(_ sender: Any) {
        freelanceTime = 0
        freelanceSalary = hourly[0].salary
        jobDeadline = hourly[0].deadline
        hasFreelance = true
        isHourly = true
        isFirstAnimate = true
        deleteFromArr(fixedPriceBool: false, at: 0)
        saveFreelance()
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func secondHourlyButtonAction(_ sender: Any) {
        freelanceTime = 0
        freelanceSalary = hourly[1].salary
        jobDeadline = hourly[1].deadline
        hasFreelance = true
        isHourly = true
        isFirstAnimate = true
        deleteFromArr(fixedPriceBool: false, at: 1)
        saveFreelance()
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func thirdHourlyButtonAction(_ sender: Any) {
        freelanceTime = 0
        freelanceSalary = hourly[2].salary
        jobDeadline = hourly[2].deadline
        hasFreelance = true
        isHourly = true
        isFirstAnimate = true
        deleteFromArr(fixedPriceBool: false, at: 2)
        saveFreelance()
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func closeUnusedLabels() {
        if freelanceSwitchCase == 4 {
            switch takeJobFixedPrice.count {
            case 0:
                zeroFixedPrice()
            case 1:
                oneFixedPrice()
            case 2:
                twoFixedPrice()
            default:
                break
            }
            
            switch takeJobHourly.count {
            case 0:
                zeroHourly()
            case 1:
                oneHourly()
            case 2:
                twoHourly()
            default:
                break
            }
        } else {
            switch fixedPrice.count {
            case 0:
                zeroFixedPrice()
            case 1:
                oneFixedPrice()
            case 2:
                twoFixedPrice()
            default:
                break
            }
            
            switch hourly.count {
            case 0:
                zeroHourly()
            case 1:
                oneHourly()
            case 2:
                twoHourly()
            default:
                break
            }
        }
    }
    
}

extension FreelanceJobListViewController {
    func selectCase() {
        switch freelanceSwitchCase {
        case 1:
            entryLevelCase()
        case 2:
            intermediateCase()
        case 3:
            expertCase()
        case 4:
            takeJobCase()
        default:
            break
        }
        
        closeUnusedLabels()
    }
    
    func entryLevelCase() {
        for index in 0..<fixedPriceEntryLevel.count {
            if fixedPriceEntryLevel[index].salary == 0 || fixedPriceEntryLevel[index].deadline == 0 {
                let addFive = Bool.random()
                var salary = Int(arc4random_uniform(50) + 1) * 10
                if addFive {
                    salary += 5
                }
                let deadline = Int.random(in: 6..<41)
                
                fixedPriceEntryLevel[index].salary = salary
                fixedPriceEntryLevel[index].deadline = deadline
            }
            
            fixedPriceJobSalaryLabel[index].text = String(fixedPriceEntryLevel[index].salary) + "$"
            fixedPriceJobNameLabels[index].text = fixedPriceEntryLevel[index].name
        }
        for index in 0..<hourlyEntryLevel.count {
            if hourlyEntryLevel[index].salary == 0 || hourlyEntryLevel[index].deadline == 0 {
                let salary = Int.random(in: 3..<11)
                let deadline = Int.random(in: 5..<69)
                
                hourlyEntryLevel[index].salary = salary
                hourlyEntryLevel[index].deadline = deadline
            }
            
            hourlyJobSalaryLabels[index].text = String(hourlyEntryLevel[index].salary) + "$/h"
            hourlyJobNameLabels[index].text = hourlyEntryLevel[index].name
        }
        
        setup()
    }
    
    func intermediateCase() {
        for index in 0..<fixedPriceIntermediate.count {
            if fixedPriceIntermediate[index].salary == 0 || fixedPriceIntermediate[index].deadline == 0 {
                let addFive = Bool.random()
                var salary = Int.random(in: 53..<250) * 10
                if addFive {
                    salary += 5
                }
                let deadline = Int.random(in: 19..<87)
                
                fixedPriceIntermediate[index].salary = salary
                fixedPriceIntermediate[index].deadline = deadline
            }
            
            fixedPriceJobSalaryLabel[index].text = String(fixedPriceIntermediate[index].salary) + "$"
            fixedPriceJobNameLabels[index].text = fixedPriceIntermediate[index].name
        }
        for index in 0..<hourlyIntermediate.count {
            if hourlyIntermediate[index].salary == 0 || hourlyIntermediate[index].deadline == 0 {
                let salary = Int.random(in: 9..<25)
                let deadline = Int.random(in: 13..<72)
                
                hourlyIntermediate[index].salary = salary
                hourlyIntermediate[index].deadline = deadline
            }
            
            hourlyJobSalaryLabels[index].text = String(hourlyIntermediate[index].salary) + "$/h"
            hourlyJobNameLabels[index].text = hourlyIntermediate[index].name
        }
        
        setup()
    }
    
    func expertCase() {
        for index in 0..<fixedPriceExpert.count {
            if fixedPriceExpert[index].salary == 0 || fixedPriceExpert[index].deadline == 0 {
                let addFive = Bool.random()
                var salary = Int.random(in: 200..<1000) * 10
                if addFive {
                    salary += 5
                }
                let deadline = Int.random(in: 32..<143)
                
                fixedPriceExpert[index].salary = salary
                fixedPriceExpert[index].deadline = deadline
            }
            
            fixedPriceJobSalaryLabel[index].text = String(fixedPriceExpert[index].salary) + "$"
            fixedPriceJobNameLabels[index].text = fixedPriceExpert[index].name
        }
        for index in 0..<hourlyExpert.count {
            if hourlyExpert[index].salary == 0 || hourlyExpert[index].deadline == 0 {
                let salary = Int.random(in: 17..<42)
                let deadline = Int.random(in: 7..<72)
                
                hourlyExpert[index].salary = salary
                hourlyExpert[index].deadline = deadline
            }
            
            hourlyJobSalaryLabels[index].text = String(hourlyExpert[index].salary) + "$/h"
            hourlyJobNameLabels[index].text = hourlyExpert[index].name
        }
        
        setup()
    }
    
    func takeJobCase() {
        for index in 0..<takeJobFixedPrice.count {
            if takeJobFixedPrice[index].salary == 0 || takeJobFixedPrice[index].deadline == 0 {
                let addFive = Bool.random()
                let increase = Int(playerMastery / 100)
                var lowerCase = 0
                var upperCase = 0
                if increase < 990 {
                    lowerCase = 1 + increase
                    upperCase = 10 + increase
                } else {
                    lowerCase = 1 + 990
                    upperCase = 10 + 990
                }
                var salary = Int.random(in: lowerCase..<upperCase) * 10
                if addFive && salary < 1000 {
                    salary += 5
                }
                let deadline = Int.random(in: 32..<143)
                
                takeJobFixedPrice[index].salary = salary
                takeJobFixedPrice[index].deadline = deadline
            }
            
            fixedPriceJobSalaryLabel[index].text = String(takeJobFixedPrice[index].salary) + "$"
            fixedPriceJobNameLabels[index].text = takeJobFixedPrice[index].name
        }
        for index in 0..<takeJobHourly.count {
            if takeJobHourly[index].salary == 0 || takeJobHourly[index].deadline == 0 {
                let increase = Int(playerMastery / 100)
                var lowerCase = 0
                var upperCase = 0
                if increase < 50 {
                    lowerCase = 3 + increase
                    upperCase = 7 + increase
                } else {
                    lowerCase = 3 + 50
                    upperCase = 7 + 50
                }
                let salary = Int.random(in: lowerCase..<upperCase)
                let deadline = Int.random(in: 12..<120)
                
                takeJobHourly[index].salary = salary
                takeJobHourly[index].deadline = deadline
            }
            
            hourlyJobSalaryLabels[index].text = String(takeJobHourly[index].salary ) + "$/h"
            hourlyJobNameLabels[index].text = takeJobHourly[index].name
        }
        
        setup()
    }
}

extension FreelanceJobListViewController {
    func setup() {
        switch freelanceSwitchCase {
        case 1:
            fixedPrice = fixedPriceEntryLevel
            hourly = hourlyEntryLevel
        case 2:
            fixedPrice = fixedPriceIntermediate
            hourly = hourlyIntermediate
        case 3:
            fixedPrice = fixedPriceExpert
            hourly = hourlyExpert
        case 4:
            fixedPrice = takeJobFixedPrice
            hourly = takeJobHourly
        default:
            break
        }
    }
    
    func deleteFromArr(fixedPriceBool: Bool, at index: Int) {
        if fixedPriceBool {
            switch freelanceSwitchCase {
            case 1:
                fixedPriceEntryLevel.remove(at: index)
            case 2:
                fixedPriceIntermediate.remove(at: index)
            case 3:
                fixedPriceExpert.remove(at: index)
            case 4:
                takeJobFixedPrice.remove(at: index)
            default:
                break
            }
        } else {
            switch freelanceSwitchCase {
            case 1:
                hourlyEntryLevel.remove(at: index)
            case 2:
                hourlyIntermediate.remove(at: index)
            case 3:
                hourlyExpert.remove(at: index)
            case 4:
                takeJobHourly.remove(at: index)
            default:
                break
            }
        }
    }
    
    func twoFixedPrice() {
        fixedPriceViews[2].isHidden = true
    }
    
    func oneFixedPrice() {
        fixedPriceViews[2].isHidden = true
        fixedPriceViews[1].isHidden = true
    }
    
    func zeroFixedPrice() {
        fixedPriceViews[0].isHidden = true
        fixedPriceViews[2].isHidden = true
        fixedPriceNoJobLabel.isHidden = false
        fixedPriceJobNameLabels[1].isHidden = true
        fixedPriceJobSalaryLabel[1].isHidden = true
        buttonsForDisableOutlet[0].isUserInteractionEnabled = false
    }
    
    func twoHourly() {
        hourlyViews[2].isHidden = true
    }
    func oneHourly() {
        hourlyViews[2].isHidden = true
        hourlyViews[1].isHidden = true
    }
    
    func zeroHourly() {
        hourlyViews[0].isHidden = true
        hourlyViews[2].isHidden = true
        hourlyNoJobLabel.isHidden = false
        hourlyJobNameLabels[1].isHidden = true
        hourlyJobSalaryLabels[1].isHidden = true
        buttonsForDisableOutlet[1].isUserInteractionEnabled = false
    }
    
    func saveFreelance() {
        UserDefaults.standard.set(hasFreelance, forKey: "hasFreelance")
        UserDefaults.standard.set(freelanceSalary, forKey: "freelanceSalary")
        UserDefaults.standard.set(isHourly, forKey: "isHourly")
        UserDefaults.standard.set(jobDeadline, forKey: "jobDeadline")
        UserDefaults.standard.set(isFirstAnimate, forKey: "isFirstAnimate")
        
        let encodedHourlyEntryData = NSKeyedArchiver.archivedData(withRootObject: hourlyEntryLevel)
        let encodedFixedEntryData = NSKeyedArchiver.archivedData(withRootObject: fixedPriceEntryLevel)
        let encodedHourlyInterData = NSKeyedArchiver.archivedData(withRootObject: hourlyIntermediate)
        let encodedFixedInterData = NSKeyedArchiver.archivedData(withRootObject: fixedPriceIntermediate)
        let encodedHourlyExpertData = NSKeyedArchiver.archivedData(withRootObject: hourlyExpert)
        let encodedFixedExpertData = NSKeyedArchiver.archivedData(withRootObject: fixedPriceExpert)
        let encodedTakeFixedData = NSKeyedArchiver.archivedData(withRootObject: takeJobFixedPrice)
        let encodedTakeHourlyData = NSKeyedArchiver.archivedData(withRootObject: takeJobHourly)
        
        UserDefaults.standard.set(encodedFixedEntryData, forKey: "fixedPriceEntryLevelArr")
        UserDefaults.standard.set(encodedFixedInterData, forKey: "fixedPriceIntermediateArr")
        UserDefaults.standard.set(encodedFixedExpertData, forKey: "fixedPriceExpertArr")
        UserDefaults.standard.set(encodedHourlyEntryData, forKey: "hourlyEntryLevelArr")
        UserDefaults.standard.set(encodedHourlyInterData, forKey: "hourlyIntermediateArr")
        UserDefaults.standard.set(encodedHourlyExpertData, forKey: "hourlyExpertArr")
        UserDefaults.standard.set(encodedTakeFixedData, forKey: "takeJobFixedPriceArr")
        UserDefaults.standard.set(encodedTakeHourlyData, forKey: "takeJobHourlyArr")
    }
}
