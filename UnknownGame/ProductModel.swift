//
//  ProductModel.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 29.12.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation

class ProductModel : NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "ProductName")
        coder.encode(imageName, forKey: "ProductImageName")
        coder.encode(bio, forKey: "ProductBio")
        coder.encode(cost, forKey: "ProductCost")
        coder.encode(isBuyed, forKey: "ProductIsBuyed")
        coder.encode(isRent, forKey: "ProductIsRent")
    }
    
    required convenience init(coder: NSCoder) {
        let name = coder.decodeObject(forKey: "ProductName") as! String
        let imageName = coder.decodeObject(forKey: "ProductImageName") as! String
        let bio = coder.decodeObject(forKey: "ProductBio") as! String
        let cost = coder.decodeInteger(forKey: "ProductCost")
        let isBuyed = coder.decodeBool(forKey: "ProductIsBuyed")
        let isRent = coder.decodeBool(forKey: "ProductIsRent")
        
        self.init(name: name, imageName: imageName, bio: bio, cost: cost, isBuyed: isBuyed, isRent: isRent)
    }
    
    init(name: String, imageName: String, bio: String, cost: Int, isBuyed: Bool, isRent: Bool) {
        self.name = name
        self.imageName = imageName
        self.bio = bio
        self.cost = cost
        self.isBuyed = isBuyed
        self.isRent = isRent
    }
    
    let imageName : String
    let cost : Int
    let name : String
    let bio : String
    var isBuyed : Bool
    let isRent : Bool
    
}
