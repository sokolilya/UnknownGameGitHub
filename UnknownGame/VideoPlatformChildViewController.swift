//
//  VideoPlatformChildViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 27/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import UIKit

class VideoPlatformChildViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createVideoPlatform()
    }
    
    @IBOutlet var videoLabelCollection: [UILabel]!
    @IBOutlet var popularityVideoCollection: [UILabel]!
    @IBOutlet var salaryVideoCollection: [UILabel]!
    @IBOutlet var durationVideoCollection: [UILabel]!
    
    @IBAction func videoLabelButtonAction(_ sender: UIButton) {
        videoBioButtonAction(sender)
    }
    
    @IBAction func videoBioButtonAction(_ sender: UIButton) {
        startVideoPlatform(index: sender.tag)
    }
    
}

extension VideoPlatformChildViewController {
    
    func createVideoPlatform() {
        for index in 1...videoPlatformNameArr.count {
            videoLabelCollection[index - 1].text = videoPlatformArr[index - 1].name
            popularityVideoCollection[index - 1].text = String(videoPlatformArr[index - 1].popularity)
            salaryVideoCollection[index - 1].text = String(videoPlatformArr[index - 1].avgSalary) + " $"
            durationVideoCollection[index - 1].text = String(videoPlatformArr[index - 1].neededTime) + " h"
        }
    }
    
    func startVideoPlatform(index: Int) {
        videoPlatformTransfer = videoPlatformArr[index - 1]
        
        videoPlatform.name = videoPlatformArr[index - 1].name
        videoPlatform.neededTime = videoPlatformArr[index - 1].neededTime
        videoPlatform.mediaTime = 0
        videoPlatform.startTime = true
        
        let userDefaults = UserDefaults.standard
        
        let encodedStreamTVData : Data = NSKeyedArchiver.archivedData(withRootObject: videoPlatform)
        userDefaults.set(encodedStreamTVData, forKey: "VideoPlatform")
        
        let encodedStreamTVTransferData : Data = NSKeyedArchiver.archivedData(withRootObject: videoPlatform)
        userDefaults.set(encodedStreamTVTransferData, forKey: "VideoPlatformTransfer")
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "dismissVideoPlatform"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateMediaProgress"), object: nil)
    }
    
}
