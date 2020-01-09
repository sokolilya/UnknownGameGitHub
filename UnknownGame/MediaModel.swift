//
//  MediaModel.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 26.12.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation

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
