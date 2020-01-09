//
//  ProfileBioModel.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 26.12.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation

class ProfileBio : NSObject, NSCoding {
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "BioName")
        coder.encode(info, forKey: "BioInfo")
        coder.encode(imageName, forKey: "BioImageName")
    }
    
    required convenience init(coder: NSCoder) {
        let name = coder.decodeObject(forKey: "BioName") as! String
        let info = coder.decodeObject(forKey: "BioInfo") as! String
        let imageName = coder.decodeObject(forKey: "BioImageName") as! String
        
        self.init(name: name, info: info, imageName: imageName)
    }
    
    init(name: String, info: String, imageName: String) {
        self.name = name
        self.info = info
        self.imageName = imageName
    }
    
    var name : String
    var info : String
    var imageName : String
    
}
