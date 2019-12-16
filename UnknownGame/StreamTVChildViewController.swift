//
//  StreamTVChildViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 27/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import UIKit

class StreamTVChildViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createStreamTV()
    }
    
    @IBOutlet var streamLabelsCollection: [UILabel]!
    @IBOutlet var popularityPointsStreamCollection: [UILabel]!
    @IBOutlet var donateStreamCollection: [UILabel]!
    @IBOutlet var durationOfStreamCollection: [UILabel]!
    
    @IBAction func selectStreamLabelButton(_ sender: UIButton) {
        selectStreamBioButton(sender)
    }
    
    @IBAction func selectStreamBioButton(_ sender: UIButton) {
        startStream(index: sender.tag)
    }
    
}

extension StreamTVChildViewController {
    
    func createStreamTV() {
        for index in 1...streamTVNameArr.count {
            streamLabelsCollection[index - 1].text = streamTVArr[index - 1].name
            popularityPointsStreamCollection[index - 1].text = String(streamTVArr[index - 1].popularity)
            donateStreamCollection[index - 1].text = String(streamTVArr[index - 1].avgSalary) + " $"
            durationOfStreamCollection[index - 1].text = String(streamTVArr[index - 1].neededTime) + " h"
        }
    }
    
    func startStream(index: Int) {
        streamTVTransfer = streamTVArr[index - 1]
        
        streamTV.name = streamTVArr[index - 1].name
        streamTV.neededTime = streamTVArr[index - 1].neededTime
        streamTV.mediaTime = 0
        streamTV.startTime = true
        
        let userDefaults = UserDefaults.standard
        
        let encodedStreamTVData : Data = NSKeyedArchiver.archivedData(withRootObject: streamTV)
        userDefaults.set(encodedStreamTVData, forKey: "StreamTV")
        
        let encodedStreamTVTransferData : Data = NSKeyedArchiver.archivedData(withRootObject: streamTV)
        userDefaults.set(encodedStreamTVTransferData, forKey: "StreamTVTransfer")
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "dismissStreamTV"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateMediaProgress"), object: nil)
    }
}
