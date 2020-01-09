//
//  ProfileModel.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 27.12.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation

class ProfileModel : NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "ProfileName")
        coder.encode(image, forKey: "ProfileImageName")
        coder.encode(imageBackground, forKey: "ProfileImageBackgroundName")
        coder.encode(bio, forKey: "ProfileBio")
    }
    
    required convenience init(coder: NSCoder) {
        let name = coder.decodeObject(forKey: "ProfileName") as! String
        let image = coder.decodeObject(forKey: "ProfileImageName") as! String
        let imageBackground = coder.decodeObject(forKey: "ProfileImageBackgroundName") as! String
        let bio = coder.decodeObject(forKey: "ProfileBio") as! [ProfileBio]
        
        self.init(name: name, image: image, imageBackground: imageBackground, bio: bio)
    }
    
    init(name: String, image: String, imageBackground: String, bio: [ProfileBio]) {
        self.name = name
        self.image = image
        self.imageBackground = imageBackground
        self.bio = bio
    }
    
    var name : String
    var image : String
    var imageBackground : String
    var bio : [ProfileBio]
    
}
