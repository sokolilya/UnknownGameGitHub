//
//  Global.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 06/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit

var playerStatus = 100
var playerMastery = 0.0
var ddIndex = 0
var hh = 12
var mm = 24
var ddArr = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sut", "Sun"]
var delay = 0.1
var statusTimeEdge = 20
var dollars = 0

var firstLaunch = true

var salary = 0
var workStartTime = 0
var workEndTime = 0
var workMasteryLevel = 0
var workPoints = 0.0
var workPointsIncrease = 1 + playerMastery / 10
let noWork = "You have no work at the moment..."
var workName = UserDefaults.standard.string(forKey: "workName")
var hasWork = UserDefaults.standard.bool(forKey: "hasWork")
var isAtNight = UserDefaults.standard.bool(forKey: "isAtNight")
var isFirstAnimate = false
var workSalaryArr: [Int] = [10, 7, 15, 13, 8]
var workStartTimeArr: [Int] = [7, 9, 13, 8, 7]
var workEndTimeArr: [Int] = [17, 21, 19, 15, 21]
var workNameArr: [String] = ["Demo Lebel 1", "Demo Lebel 2", "Demo Lebel 3", "Demo Lebel 4", "Demo Lebel 5"]


class Job : NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "jobName")
        coder.encode(salary, forKey: "jobSalary")
        coder.encode(deadline, forKey: "jobDeadline")
    }
    
    required convenience init(coder: NSCoder) {
        let name = coder.decodeObject(forKey: "jobName") as! String
        let salary = coder.decodeInteger(forKey: "jobSalary")
        let deadline = coder.decodeInteger(forKey: "jobDeadline")
        
        self.init(name: name, salary: salary, deadline: deadline)
    }
    
    init(name: String, salary: Int, deadline: Int) {
        self.name = name
        self.salary = salary
        self.deadline = deadline
    }
    
    var name : String = ""
    var salary : Int
    var deadline : Int
}
var hasFreelance = false
var freelanceSalary = 0
var isHourly = false
var jobDeadline = 100
var jobProgress = 0
var freelanceCase = 0
var freelanceTime = 0
let hourlyJobChance = 10
let fixedPriceJobChance = 10
let takeJobChance = 5
var fixedPriceEntryLevel : [Job] = []
var hourlyEntryLevel : [Job] = []
var fixedPriceIntermediate : [Job] = []
var hourlyIntermediate : [Job] = []
var fixedPriceExpert : [Job] = []
var hourlyExpert : [Job] = []
var takeJobFixedPrice : [Job] = []
var takeJobHourly : [Job] = []
var freelanceJobNames = ["Develop Website", "Create iOS Game", "Need iOS Developer", "Need Developer", "Full-Stack Developer", "Add New Features", "Need App Developer", "Create Transport App", "Android and iOS App", "Mobile App Development", "Native iOS Developer", "Native Android Developer", "Skilled Developer", "Game Tester", "Need Tester", "Skilled iOS Developer", "Clone App", "Reskin App", "Deploy App to Store", "Bug Fixes Needed", "Copyrighter needed", "Develop Music App", "Develop iPad App", "Improve My App", "Upload App to Store", "Answer Questions", "Database", "Database App", "Swift Developer", "Kotlin Developer", "Help With SturtUp", "Consult Needed", "Copy Existing App", "Flutter Developer", "Create 2D Game", "Create 3D Game", "Develop Android App", "Android App", "iOS App", "PHP Developer", "Create Website", "React Native Developer", "Mobile App", "Convert Mobile App", "Convert Code", "Developer Needed", "VR Game", "VR Developer", "Develop VR Game", "Kotlin Expert", "Swift Expert", "Convert My App", "Designer Needed", "Create Design", "Re-Design My App", "Reskin My App", "Only Real People", "Only Developers", "Only Designers", "Java Developer", "Java App", "Java Expert", "C++ Developer", "Consult With C++", "C++ Bug Fixes", "Java Bug Fixes", "App for iPhone", "Skilled Developer"]

class Media : NSObject, NSCoding {
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "mediaName")
        coder.encode(popularity, forKey: "mediaPopularity")
        coder.encode(followers, forKey: "mediaFollowers")
        coder.encode(avgSalary, forKey: "mediaAvgSalary")
        coder.encode(neededTime, forKey: "mediaNeededTime")
        coder.encode(startTime, forKey: "mediaStartTime")
        coder.encode(mediaTime, forKey: "mediaTime")
    }
    
    required convenience init(coder: NSCoder) {
        let name = coder.decodeObject(forKey: "mediaName") as? String ?? ""
        let popularity = coder.decodeInteger(forKey: "mediaPopularity")
        let followers = coder.decodeInteger(forKey: "mediaFollowers")
        let avgSalary = coder.decodeInteger(forKey: "mediaAvgSalary")
        let neededTime = coder.decodeInteger(forKey: "mediaNeededTime")
        let startTime = coder.decodeBool(forKey: "mediaStartTime")
        let mediaTime = coder.decodeInteger(forKey: "mediaTime")
        
        self.init(name: name, popularity: popularity, followers: followers, avgSalary: avgSalary, neededTime: neededTime, startTime: startTime, mediaTime: mediaTime)
    }
    
    init(name: String, popularity: Int, followers: Int, avgSalary: Int, neededTime: Int, startTime: Bool, mediaTime: Int) {
        self.name = name
        self.popularity = popularity
        self.followers = followers
        self.avgSalary = avgSalary
        self.neededTime = neededTime
        self.startTime = startTime
        self.mediaTime = mediaTime
    }
    
    var name : String = ""
    var popularity : Int = 0
    var followers : Int = 0
    var avgSalary : Int = 0
    var neededTime : Int = 0
    var startTime : Bool = false
    var mediaTime : Int = 0
}

var streamTVArr : [Media] = []
var streamTVSavedArr : [Media] = []
var streamTV : Media = Media(name: "Stream TV", popularity: 0, followers: 0, avgSalary: 0, neededTime: 0, startTime: false, mediaTime: 0)
var streamTVTransfer : Media = Media(name: "", popularity: 0, followers: 0, avgSalary: 0, neededTime: 0, startTime: false, mediaTime: 0)
let streamTVNameArr : [String] = ["Communication", "Questions", "Co-op with friends", "Stream Game (Adults Only Rating)", "Stream Game (16+ Age Rating)", "Stream Game (12+ Age Rating)", "Stream Game (7+ Age Rating)", "Stream Game (3+ Age Rating)"]
let streamTVPopularityArr : [Int] = [3, 1, 4, 2, 4, 5, 3, 2]
var streamTVAvgDonateArr : [Int] = [5, 7, 3, 6, 2, 3, 2, 4]
let streamTVNeededTimeArr : [Int] = [2, 1, 5, 8, 7, 4, 3, 2]
var streamTVLF = 0

var videoPlatformArr : [Media] = []
var videoPlatformSavedArr : [Media] = []
var videoPlatform : Media = Media(name: "Media Platform", popularity: 0, followers: 0, avgSalary: 0, neededTime: 0, startTime: false, mediaTime: 0)
var videoPlatformTransfer : Media = Media(name: "", popularity: 0, followers: 0, avgSalary: 0, neededTime: 0, startTime: false, mediaTime: 0)
let videoPlatformNameArr : [String] = ["Vlog", "Game Review", "Interview", "Walkthrough", "Top 10", "Unpacking", "Crash Test", "Facts", "Recomendations", "News"]
let videoPlatformPopularityArr : [Int] = [5, 6, 8, 3, 10, 9, 11, 7, 5, 9]
var videoPlatformAvgSalaryArr : [Int] = [50, 60, 40, 10, 70, 60, 100, 40, 30, 50]
let videoPlatformNeededTimeArr : [Int] = [10, 15, 8, 3, 13, 12, 9, 11, 8, 10]
var videoPlatformLF = 0

class Promotion: NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "promoName")
        coder.encode(popularity, forKey: "promoPopularity")
        coder.encode(followers, forKey: "promoFollowers")
        coder.encode(cost, forKey: "promoCost")
        coder.encode(isStreamTV, forKey: "promoIsStreamTV")
    }
    
    required convenience init(coder: NSCoder) {
        let name = coder.decodeObject(forKey: "promoName") as! String
        let popularity = coder.decodeInteger(forKey: "promoPopularity")
        let followers = coder.decodeInteger(forKey: "promoFollowers")
        let cost = coder.decodeInteger(forKey: "promoCost")
        let isStreamTV = coder.decodeBool(forKey: "promoIsStreamTV")
        let isPopularity = coder.decodeBool(forKey: "promoIsPopularity")
        
        self.init(name: name, popularity: popularity, followers: followers, cost: cost, isStreamTV: isStreamTV, isPopularity: isPopularity)
    }
    
    init(name: String, popularity: Int, followers: Int, cost: Int, isStreamTV: Bool, isPopularity: Bool) {
        self.name = name
        self.popularity = popularity
        self.followers = followers
        self.cost = cost
        self.isStreamTV = isStreamTV
        self.isPopularity = isPopularity
    }
    
    var name : String = ""
    var popularity : Int = 0
    var followers : Int = 0
    var cost : Int = 0
    var isStreamTV : Bool = false
    var isPopularity : Bool = false
}

var isStreamTV = false
var promotion : [Promotion] = [Promotion(name: "Test Pop", popularity: 111, followers:                                                111, cost: 111, isStreamTV: true, isPopularity: true),
                               Promotion(name: "Test Followers Stream Promo 1", popularity: 111, followers: 111, cost: 111, isStreamTV: true, isPopularity: false),
                               Promotion(name: "Test Followers Stream Promo 2", popularity: 222, followers: 222, cost: 222, isStreamTV: true, isPopularity: false),
                               Promotion(name: "Test Popularity Video Platform Promo", popularity: 111, followers: 111, cost: 111, isStreamTV: false, isPopularity: true),
                               Promotion(name: "Test Followers Video Platform Promo", popularity: 111, followers: 111, cost: 111, isStreamTV: false, isPopularity: false)]
