//
//  PromotionModel.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 26.12.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation

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
