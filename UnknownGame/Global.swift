//
//  Global.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 06/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit

    // MARK: – Genegal Global Variables

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

    // MARK: – Work Global Variables

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

    // MARK: – Job Global Variables

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

    // MARK: – Media Global Variables

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

    // MARK: – Promotion Global Variables

var isStreamTV = false
var promotion : [Promotion] = [Promotion(name: "Test Pop", popularity: 111, followers:                                                111, cost: 111, isStreamTV: true, isPopularity: true),
                               Promotion(name: "Test Followers Stream Promo 1", popularity: 111, followers: 111, cost: 111, isStreamTV: true, isPopularity: false),
                               Promotion(name: "Test Followers Stream Promo 2", popularity: 222, followers: 222, cost: 222, isStreamTV: true, isPopularity: false),
                               Promotion(name: "Test Popularity Video Platform Promo", popularity: 111, followers: 111, cost: 111, isStreamTV: false, isPopularity: true),
                               Promotion(name: "Test Followers Video Platform Promo", popularity: 111, followers: 111, cost: 111, isStreamTV: false, isPopularity: false)]

var currentVC : Int = 0
var destinationVC : Int = 0

    // MARK: – Profile Global Variables

var player : ProfileModel = ProfileModel(name: "", image: "", imageBackground: "", bio: [ProfileBio(name: "", info: "", imageName: ""),
                                                                                                                            ProfileBio(name: "", info: "", imageName: ""),
                                                                                                                               ProfileBio(name: "", info: "", imageName: ""),
                                                                                                                    ProfileBio(name: "", info: "", imageName: "")])


let placeholderImages : [String] = ["placeholder_1_1", "placeholder_1_2", "placeholder_1_3", "placeholder_1_4", "placeholder_1_5"]
let placeholderBackgroundImages : [String] = ["placeholderBackground_1", "placeholderBackground_2", "placeholderBackground_3", "placeholderBackground_4", "placeholderBackground_5", "placeholderBackground_6", "placeholderBackground_7", "placeholderBackground_8", "placeholderBackground_9"]
var placeholderImageIndex : Int = -1
var placeholderBackgroundImageIndex : Int = -1
var segmentedControllerIndex : Int = 0

    // MARK: – Shop Global Variables

var shopTag : Int = 0
var shopIndex : Int = 0
var toShop_Name : String = ""
var product_realty : [ProductModel] = [
                                        ProductModel(name: "Rental Hostel", imageName: "hostel", bio: "You and your 3 roommates", cost: 1000, isBuyed: false, isRent: true),
                                        ProductModel(name: "Rental Flat", imageName: "flat_1", bio: "You live alone, but in the rental realty", cost: 3000, isBuyed: false, isRent: true),
                                        ProductModel(name: "Room", imageName: "room", bio: "", cost: 7000, isBuyed: false, isRent: false),
                                        ProductModel(name: "Rental Apartments", imageName: "apartments_1", bio: "", cost: 15000, isBuyed: false, isRent: true),
                                        ProductModel(name: "Flat", imageName: "flat_2", bio: "", cost: 100000, isBuyed: false, isRent: false),
                                        ProductModel(name: "Apartments", imageName: "apartments_2", bio: "", cost: 500000, isBuyed: false, isRent: false),
                                        ProductModel(name: "Cottage", imageName: "cottage", bio: "", cost: 1000000, isBuyed: false, isRent: false),
                                        ProductModel(name: "Penthouse", imageName: "penthouse", bio: "", cost: 3000000, isBuyed: false, isRent: false),
                                        ProductModel(name: "Villa", imageName: "villa", bio: "", cost: 7000000, isBuyed: false, isRent: false),
                                        ProductModel(name: "Castle", imageName: "castle", bio: "", cost: 30000000, isBuyed: false, isRent: false)
                                       ]
var product_transport : [ProductModel] = [
                                          ProductModel(name: "Scooter", imageName: "scooter_1", bio: "", cost: 150, isBuyed: false, isRent: false),
                                          ProductModel(name: "Bycicle", imageName: "bycicle_1", bio: "", cost: 270, isBuyed: false, isRent: false),
                                          ProductModel(name: "Electric Scooter", imageName: "scooter_2", bio: "", cost: 450, isBuyed: false, isRent: false),
                                          ProductModel(name: "Electric Bycicle", imageName: "bycicle_2", bio: "", cost: 1000, isBuyed: false, isRent: false),
                                          ProductModel(name: "Cheepest Old Car", imageName: "car_1", bio: "", cost: 5000, isBuyed: false, isRent: false),
                                          ProductModel(name: "Common Car", imageName: "car_2", bio: "", cost: 20000, isBuyed: false, isRent: false),
                                          ProductModel(name: "Lux Car", imageName: "car_3", bio: "", cost: 100000, isBuyed: false, isRent: false),
                                          ProductModel(name: "Retro Car", imageName: "car_4", bio: "", cost: 250000, isBuyed: false, isRent: false),
                                          ProductModel(name: "Helicopter", imageName: "helicopter", bio: "", cost: 750000, isBuyed: false, isRent: false),
                                          ProductModel(name: "Yacht", imageName: "ship", bio: "", cost: 3000000, isBuyed: false, isRent: false),
                                          ProductModel(name: "Airplain", imageName: "airplain", bio: "", cost: 15000000, isBuyed: false, isRent: false),
                                        ]
var product_phone : [ProductModel] = [
                                      ProductModel(name: "Old phone", imageName: "phone_1", bio: "", cost: 100, isBuyed: false, isRent: false),
                                      ProductModel(name: "PPC", imageName: "phone_2", bio: "", cost: 200, isBuyed: false, isRent: false),
                                      ProductModel(name: "Strange Phone", imageName: "phone_3", bio: "", cost: 350, isBuyed: false, isRent: false),
                                      ProductModel(name: "Smartphone", imageName: "phone_4", bio: "", cost: 500, isBuyed: false, isRent: false),
                                      ProductModel(name: "Best Smartphone", imageName: "phone_5", bio: "", cost: 1500, isBuyed: false, isRent: false),
                                      ProductModel(name: "Exclusive Phone", imageName: "phone_6", bio: "", cost: 100000, isBuyed: false, isRent: false)
                                        ]
var product_pc : [ProductModel] = [
                                   ProductModel(name: "Cheep", imageName: "pc_1", bio: "", cost: 500, isBuyed: false, isRent: false),
                                   ProductModel(name: "Bad", imageName: "pc_2", bio: "", cost: 1200, isBuyed: false, isRent: false),
                                   ProductModel(name: "Medium", imageName: "pc_3", bio: "", cost: 2500, isBuyed: false, isRent: false),
                                   ProductModel(name: "Cool", imageName: "pc_4", bio: "", cost: 6000, isBuyed: false, isRent: false),
                                   ProductModel(name: "Expensive", imageName: "pc_5", bio: "Best of the Best", cost: 15000, isBuyed: false, isRent: false)
                                    ]
