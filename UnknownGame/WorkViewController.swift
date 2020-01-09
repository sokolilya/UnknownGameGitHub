//
//  ShopViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 06/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import UIKit
import Foundation
import LinearProgressView

class WorkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if firstLaunch {
            perform(#selector(runTime), with: nil, afterDelay: delay)
            firstLaunch = false
        }
        
        self.tabBarController?.tabBar.isHidden = true
        
        setupUI()
        setupTabBar()
        
        loadData()
        updateStreamTV()
        updateVideoPlatform()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkFreelance()
    }
    
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playerStatusLabel: UILabel!
    @IBOutlet weak var dollarsLabel: UILabel!
    @IBOutlet weak var freelanceProgressView: LinearProgressView!
    @IBOutlet weak var freelanceButtonOutlet: UIButton!
    
}

extension WorkViewController {
    func setupStreamTVArr(empty: Bool) {
        for index in 1...streamTVNameArr.count {
            
            var streamName : String = ""
            var popularity : Int = 0
            var avgDonate : Int = 0
            var neededTime : Int = 0
            var startTime : Bool = false
            var mediaTime : Int = 0
            var followers : Int = 0
            
            if empty {
                streamName = streamTVNameArr[index - 1]
                popularity = streamTVPopularityArr[index - 1]
                avgDonate = streamTVAvgDonateArr[index - 1]
                neededTime = streamTVNeededTimeArr[index - 1]
            } else {
                streamName = streamTVSavedArr[index - 1].name
                popularity = streamTVSavedArr[index - 1].popularity
                avgDonate = streamTVSavedArr[index - 1].avgSalary
                neededTime = streamTVSavedArr[index - 1].neededTime
                startTime = streamTVSavedArr[index - 1].startTime
                mediaTime = streamTVSavedArr[index - 1].mediaTime
                followers = streamTVSavedArr[index - 1].followers
            }
            
            streamTVArr.append(Media(name: streamName, popularity: popularity, followers: followers, avgSalary: avgDonate, neededTime: neededTime, startTime: startTime, mediaTime: mediaTime))
        }
    }
    
    func updateStreamTV() {
        let userDefaults = UserDefaults.standard
        
        if !streamTVSavedArr.isEmpty {
            setupStreamTVArr(empty: false)
        } else {
            setupStreamTVArr(empty: true)
        }
        
        let encodedData : Data = NSKeyedArchiver.archivedData(withRootObject: streamTVArr)
        userDefaults.set(encodedData, forKey: "StreamTVArray")
    }
}

extension WorkViewController {
    
    func setupVideoPlatform(empty: Bool) {
        for index in 1...videoPlatformNameArr.count {
            
            var videoName : String = ""
            var popularity : Int = 0
            var avgDonate : Int = 0
            var neededTime : Int = 0
            var startTime : Bool = false
            var mediaTime : Int = 0
            var followers : Int = 0
            
            if empty {
                videoName = videoPlatformNameArr[index - 1]
                popularity = videoPlatformPopularityArr[index - 1]
                avgDonate = videoPlatformAvgSalaryArr[index - 1]
                neededTime = videoPlatformNeededTimeArr[index - 1]
            } else {
                videoName = videoPlatformSavedArr[index - 1].name
                popularity = videoPlatformSavedArr[index - 1].popularity
                avgDonate = videoPlatformSavedArr[index - 1].avgSalary
                neededTime = videoPlatformSavedArr[index - 1].neededTime
                startTime = videoPlatformSavedArr[index - 1].startTime
                mediaTime = videoPlatformSavedArr[index - 1].mediaTime
                followers = videoPlatformSavedArr[index - 1].followers
            }
            
            videoPlatformArr.append(Media(name: videoName, popularity: popularity, followers: followers, avgSalary: avgDonate, neededTime: neededTime, startTime: startTime, mediaTime: mediaTime))
        }
    }
    
    func updateVideoPlatform() {
        let userDefaults = UserDefaults.standard
        
        if !videoPlatformSavedArr.isEmpty {
            setupVideoPlatform(empty: false)
        } else {
            setupVideoPlatform(empty: true)
        }
        
        let encodedData : Data = NSKeyedArchiver.archivedData(withRootObject: videoPlatformArr)
        userDefaults.set(encodedData, forKey: "VideoPlatformArray")
    }
}

extension WorkViewController {
    @objc func runTime() {
        mm += 1
        if (hasFreelance && hasWork && ((!isAtNight && ((hh > workEndTime && hh < 24) || (hh < workStartTime && hh >= 0))) || (isAtNight && ((hh > workStartTime && hh < 24) || (hh < workEndTime && hh >= 0))))) || (!hasWork && hasFreelance) {
            freelanceTime = 1
        } else {
            freelanceTime = 0
        }
        if freelanceTime == 1 {
            if isHourly {
                jobProgress += 1
                if jobProgress == jobDeadline * 60 {
                    hasFreelance = false
                    checkFreelance()
                }
                if jobProgress % 60 == 0 {
                    dollars += freelanceSalary
                }
            } else {
                jobProgress += 1
                if jobProgress == jobDeadline * 60 {
                    hasFreelance = false
                    dollars += freelanceSalary
                    checkFreelance()
                }
            }
            freelanceProgressView.setProgress(Float(jobProgress), animated: true)
            if isFirstAnimate {
                isFirstAnimate = false
                jobProgress = 0
                UserDefaults.standard.set(isFirstAnimate, forKey: "isFirstAnimate")
            }
            UserDefaults.standard.set(jobProgress, forKey: "jobProgress")
        }
        
        if streamTV.startTime {
            streamTV.mediaTime += 1
            let random = Int(arc4random_uniform(UInt32(100)) + 1)
            
            if random < 10 {
                let randomBool = Bool.random()
                let offset = Int(arc4random_uniform(UInt32(7)))
                if randomBool {
                    dollars += streamTV.avgSalary + offset
                } else {
                    if streamTV.avgSalary > offset {
                        dollars += streamTV.avgSalary - offset
                    }
                }
            }
            if random >= 15 && random <= 20 && streamTV.followers < streamTV.popularity / Int.random(in: 3...7) {
                streamTV.followers += 1
            } else if random == 55 && streamTV.followers > 10 {
                streamTV.followers -= 1
            }
            if streamTV.mediaTime == streamTV.neededTime * 100 {
                streamTV.startTime = false
                streamTV.popularity += streamTVTransfer.popularity
            }
            
            let encodedStreamTVData : Data = NSKeyedArchiver.archivedData(withRootObject: streamTV)
            UserDefaults.standard.set(encodedStreamTVData, forKey: "StreamTV")
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateMediaProgressView"), object: nil)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateMediaLabels"), object: nil)
        }
        
        if videoPlatform.startTime {
            videoPlatform.mediaTime += 1
            let random = Int(arc4random_uniform(UInt32(100)) + 1)
            
            if videoPlatform.mediaTime == videoPlatform.neededTime * 100 {
                if random < 10 {
                    let offset = Int(arc4random_uniform(UInt32(50)))
                    let randomBool = Bool.random()
                    
                    if randomBool {
                        dollars += videoPlatform.avgSalary + offset
                    } else {
                        if streamTV.avgSalary > offset {
                            dollars += videoPlatform.avgSalary - offset
                        }
                    }
                }
                videoPlatform.startTime = false
                videoPlatform.popularity += videoPlatformTransfer.popularity
            }
            
            let encodedVideoPlatformData : Data = NSKeyedArchiver.archivedData(withRootObject: videoPlatform)
            UserDefaults.standard.set(encodedVideoPlatformData, forKey: "VideoPlatform")
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateMediaProgressView"), object: nil)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateMediaLabels"), object: nil)
        }
        
        let random = Int.random(in: 1...100)
        
        if random == 15 && videoPlatform.followers <= videoPlatform.popularity - Int.random(in: 1...100) {
            videoPlatform.followers += 1
        }
        
        if mm == 60 {
            hh += 1
            mm = 0
            if !hasFreelance {
                addEntryLevel()
                addIntermediate()
                addExpert()
                addTakeJob()
            }
        }
        
        if mm % statusTimeEdge == 0 && playerStatus > 0 && hasWork {
            playerStatus -= 1
        }
        
        if hh == 24 {
            hh = 0
            ddIndex += 1
        }
        
        if (hh == workEndTime && mm == 0 && hasWork && !isAtNight && ddIndex != 5 && ddIndex != 6) || (hh == workStartTime && mm == 0 && hasWork && isAtNight && ddIndex != 5 && ddIndex != 6) {
            dollars += salary + workMasteryLevel * salary / 10
            workPoints += workPointsIncrease
            if ddIndex == 4 {
                playerMastery += 1
                UserDefaults.standard.set(playerMastery, forKey: "playerMastery")
            }
            if workPoints == 10.0 || workPoints == 35.0 || workPoints == 100.0 || workPoints == 200.0 || workPoints == 400.0 || workPoints == 850.0 || workPoints == 2000.0 || workPoints == 5000.0 || workPoints == 15000.0 || workPoints == 35000.0 {
                workMasteryLevel += 1
                UserDefaults.standard.set(workMasteryLevel, forKey: "workMasteryLevel")
            }
            
        }
        
        if ddIndex == 7 {
            ddIndex = 0
        }
            
        checkFreelance()
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
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(hh, forKey: "time_HH")
        userDefaults.set(mm, forKey: "time_MM")
        userDefaults.set(ddIndex, forKey: "time_DD_Index")
        userDefaults.set(playerStatus, forKey: "player_Status")
        userDefaults.set(dollars, forKey: "dollars")
        
        perform(#selector(runTime), with: nil, afterDelay: delay)
    }
    
    func loadData() {
        let userDefaults = UserDefaults.standard
        
        hh = userDefaults.integer(forKey: "time_HH")
        mm = userDefaults.integer(forKey: "time_MM")
        ddIndex = userDefaults.integer(forKey: "time_DD_Index")
        playerStatus = userDefaults.integer(forKey: "player_Status")
        dollars = userDefaults.integer(forKey: "dollars")
        
        workMasteryLevel = userDefaults.integer(forKey: "workMasteryLevel")
        playerMastery = userDefaults.double(forKey: "playerMastery")
        salary = userDefaults.integer(forKey: "salary")
        workStartTime = userDefaults.integer(forKey: "workStartTime")
        workEndTime = userDefaults.integer(forKey: "workEndTime")
        workPoints = userDefaults.double(forKey: "workPoints")
        
        isFirstAnimate = userDefaults.bool(forKey: "isFirstAnimate")
        hasFreelance = userDefaults.bool(forKey: "hasFreelance")
        freelanceSalary = userDefaults.integer(forKey: "freelanceSalary")
        isHourly = userDefaults.bool(forKey: "isHourly")
        jobDeadline = userDefaults.integer(forKey: "jobDeadline")
        jobProgress = userDefaults.integer(forKey: "jobProgress")
        
        streamTVLF = userDefaults.integer(forKey: "StreamTVLastFollower")
        videoPlatformLF = userDefaults.integer(forKey: "VideoPlatformLastFollower")
        
        // StreamTV
        
        if let decodedStreamTVArr = userDefaults.data(forKey: "StreamTVArray") {
            streamTVSavedArr = NSKeyedUnarchiver.unarchiveObject(with: decodedStreamTVArr) as! [Media]
        }
        
        if let decodedStreamTV = userDefaults.data(forKey: "StreamTV") {
            streamTV = NSKeyedUnarchiver.unarchiveObject(with: decodedStreamTV) as! Media
        }
        
        if let decodedStreamTVTransferData = userDefaults.data(forKey: "StreamTVTransfer") {
            streamTVTransfer = NSKeyedUnarchiver.unarchiveObject(with: decodedStreamTVTransferData) as! Media
        }
        
        // Video Platform
        
        if let decodedVideoPlatfromArr = userDefaults.data(forKey: "VideoPlatformArray") {
            videoPlatformArr = NSKeyedUnarchiver.unarchiveObject(with: decodedVideoPlatfromArr) as! [Media]
        }
        
        if let decodedVideoPlatfrom = userDefaults.data(forKey: "VideoPlatform") {
            videoPlatform = NSKeyedUnarchiver.unarchiveObject(with: decodedVideoPlatfrom) as! Media
        }
        
        if let decodedVideoPlatfromTransfer = userDefaults.data(forKey: "VideoPlatformTransfer") {
            videoPlatformTransfer = NSKeyedUnarchiver.unarchiveObject(with: decodedVideoPlatfromTransfer) as! Media
        }
        
        // Freelance
        
        if let decodedFEL = userDefaults.data(forKey: "fixedPriceEntryLevelArr") {
            fixedPriceEntryLevel = NSKeyedUnarchiver.unarchiveObject(with: decodedFEL) as! [Job]
        }
        
        if let decodedFI = userDefaults.data(forKey: "fixedPriceIntermediateArr") {
            fixedPriceIntermediate = NSKeyedUnarchiver.unarchiveObject(with: decodedFI) as! [Job]
        }
        
        if let decodedFE = userDefaults.data(forKey: "fixedPriceExpertArr") {
            fixedPriceExpert = NSKeyedUnarchiver.unarchiveObject(with: decodedFE) as! [Job]
        }
        
        if let decodedHEL = userDefaults.data(forKey: "hourlyEntryLevelArr") {
            hourlyEntryLevel = NSKeyedUnarchiver.unarchiveObject(with: decodedHEL) as! [Job]
        }
        
        if let decodedHI = userDefaults.data(forKey: "hourlyIntermediateArr") {
            hourlyIntermediate = NSKeyedUnarchiver.unarchiveObject(with: decodedHI) as! [Job]
        }
        
        if let decodedHE = userDefaults.data(forKey: "hourlyExpertArr") {
            hourlyExpert = NSKeyedUnarchiver.unarchiveObject(with: decodedHE) as! [Job]
        }
        
        if let decodedTF = userDefaults.data(forKey: "takeJobFixedPriceArr") {
            takeJobFixedPrice = NSKeyedUnarchiver.unarchiveObject(with: decodedTF) as! [Job]
        }
        
        if let decodedTH = userDefaults.data(forKey: "takeJobHourlyArr") {
            takeJobHourly = NSKeyedUnarchiver.unarchiveObject(with: decodedTH) as! [Job]
        }
        
        // Profile
        
        if let decodedProfileData = userDefaults.data(forKey: "ProfileData") {
            player = NSKeyedUnarchiver.unarchiveObject(with: decodedProfileData) as! ProfileModel
        }
    }
    
    func checkFreelance() {
        if hasFreelance {
            freelanceProgressView.minimumValue = 0
            freelanceProgressView.animationDuration = 2.0
            freelanceProgressView.barInset = 0.0
            freelanceProgressView.maximumValue = Float(jobDeadline * 60)
            if isFirstAnimate {
                freelanceProgressView.setProgress(Float(jobDeadline * 60), animated: false)
            }
            freelanceProgressView.isHidden = false
        } else {
            freelanceProgressView.isHidden = true
            UserDefaults.standard.set(hasFreelance, forKey: "hasFreelance")
        }
    }
    
    func addEntryLevel() {
        if fixedPriceEntryLevel.count < 3 {
            let chanceOfJob = Int(arc4random_uniform(100) + 1)
            if chanceOfJob <= fixedPriceJobChance {
                let jobName = Int(arc4random_uniform(UInt32(freelanceJobNames.count)))
                fixedPriceEntryLevel.append(Job(name: freelanceJobNames[jobName], salary: 0, deadline: 0))
                
                let encodedFixedEntryData = NSKeyedArchiver.archivedData(withRootObject: fixedPriceEntryLevel)
                UserDefaults.standard.set(encodedFixedEntryData, forKey: "fixedPriceEntryLevelArr")
            }
        }
        if hourlyEntryLevel.count < 3 {
            let chanceOfJob = Int(arc4random_uniform(100) + 1)
            if chanceOfJob <= hourlyJobChance {
                let jobName = Int(arc4random_uniform(UInt32(freelanceJobNames.count)))
                hourlyEntryLevel.append(Job(name: freelanceJobNames[jobName], salary: 0, deadline: 0))
                
                let encodedHourlyEntryData = NSKeyedArchiver.archivedData(withRootObject: hourlyEntryLevel)
                UserDefaults.standard.set(encodedHourlyEntryData, forKey: "hourlyEntryLevelArr")
            }
        }
    }
    
    func addIntermediate() {
        if fixedPriceIntermediate.count < 3 {
            let chanceOfJob = Int(arc4random_uniform(100) + 1)
            if chanceOfJob <= fixedPriceJobChance {
                let jobName = Int(arc4random_uniform(UInt32(freelanceJobNames.count)))
                fixedPriceIntermediate.append(Job(name: freelanceJobNames[jobName], salary: 0, deadline: 0))
                
                let encodedFixedInterData = NSKeyedArchiver.archivedData(withRootObject: fixedPriceIntermediate)
                UserDefaults.standard.set(encodedFixedInterData, forKey: "fixedPriceIntermediateArr")
            }
        }
        if hourlyIntermediate.count < 3 {
            let chanceOfJob = Int(arc4random_uniform(100) + 1)
            if chanceOfJob <= hourlyJobChance {
                let jobName = Int(arc4random_uniform(UInt32(freelanceJobNames.count)))
                hourlyIntermediate.append(Job(name: freelanceJobNames[jobName], salary: 0, deadline: 0))
                
                let encodedHourlyInterData = NSKeyedArchiver.archivedData(withRootObject: hourlyIntermediate)
                UserDefaults.standard.set(encodedHourlyInterData, forKey: "hourlyIntermediateArr")
            }
        }
    }
    
    func addExpert() {
        if fixedPriceExpert.count < 3 {
            let chanceOfJob = Int(arc4random_uniform(100) + 1)
            if chanceOfJob <= fixedPriceJobChance {
                let jobName = Int(arc4random_uniform(UInt32(freelanceJobNames.count)))
                fixedPriceExpert.append(Job(name: freelanceJobNames[jobName], salary: 0, deadline: 0))
                
                let encodedFixedExpertData = NSKeyedArchiver.archivedData(withRootObject: fixedPriceExpert)
                UserDefaults.standard.set(encodedFixedExpertData, forKey: "fixedPriceExpertArr")
            }
        }
        if hourlyExpert.count < 3 {
            let chanceOfJob = Int(arc4random_uniform(100) + 1)
            if chanceOfJob <= hourlyJobChance {
                let jobName = Int(arc4random_uniform(UInt32(freelanceJobNames.count)))
                hourlyExpert.append(Job(name: freelanceJobNames[jobName], salary: 0, deadline: 0))
                
                let encodedHourlyExpertData = NSKeyedArchiver.archivedData(withRootObject: hourlyExpert)
                UserDefaults.standard.set(encodedHourlyExpertData, forKey: "hourlyExpertArr")
            }
        }
    }
    
    func addTakeJob() {
        if takeJobHourly.count < 3 {
            let chanceOfJob = Int(arc4random_uniform(100) + 1)
            if chanceOfJob <= takeJobChance {
                let jobName = Int(arc4random_uniform(UInt32(freelanceJobNames.count)))
                takeJobHourly.append(Job(name: freelanceJobNames[jobName], salary: 0, deadline: 0))
                
                let encodedTakeHourlyData = NSKeyedArchiver.archivedData(withRootObject: takeJobHourly)
                UserDefaults.standard.set(encodedTakeHourlyData, forKey: "takeJobHourlyArr")
            }
        }
        if takeJobFixedPrice.count < 3 {
            let chanceOfJob = Int(arc4random_uniform(100) + 1)
            if chanceOfJob <= takeJobChance {
                let jobName = Int(arc4random_uniform(UInt32(freelanceJobNames.count)))
                takeJobFixedPrice.append(Job(name: freelanceJobNames[jobName], salary: 0, deadline: 0))
                
                let encodedTakeFixedData = NSKeyedArchiver.archivedData(withRootObject: takeJobFixedPrice)
                UserDefaults.standard.set(encodedTakeFixedData, forKey: "takeJobFixedPriceArr")
            }
        }
    }
}

extension WorkViewController {
    
    func setupUI() {
        let modelName = UIDevice.modelName
        
        switch modelName {
        case "iPhone X", "iPhone XS", "iPhone XS Max", "iPhone XR", "iPhone 11", "iPhone 11 Pro", "iPhone 11 Pro Max":
            backgroundImage.image = UIImage(named: "background_1_11")
        default:
            backgroundImage.image = UIImage(named: "background_1_8")
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
