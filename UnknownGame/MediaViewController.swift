//
//  MediaViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 19/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit
import LinearProgressView

class MediaViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateProgressViews), name: NSNotification.Name("updateMediaProgress"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateLabels), name: NSNotification.Name("updateMediaLabels"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateProgressView), name: NSNotification.Name("updateMediaProgressView"), object: nil)
        checkAvgSalary()
        updateProgressViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkAvgSalary()
        updateProgressViews()
    }
    
    @IBOutlet weak var streamTVLabel: UILabel!
    @IBOutlet var streamTVstatsLabels: [UILabel]!
    @IBOutlet weak var videoPlatformLabel: UILabel!
    @IBOutlet var videoPlatformStatsLabels: [UILabel]!
    @IBOutlet weak var streamTVButtonOutlet: UIButton!
    @IBAction func selectStreamTVButtonAction(_ sender: Any) {
    }
    
    @IBAction func toStreamTVPromotion(_ sender: Any) {
        isStreamTV = true
    }
    
    @IBOutlet weak var videoPlatformButtonOutlet: UIButton!
    @IBAction func selectVideoPlatformButtonAction(_ sender: Any) {
    }
    
    @IBAction func toVideoPlatformPromotion(_ sender: Any) {
        isStreamTV = false
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var streamTVProgressView: LinearProgressView!
    @IBOutlet weak var videoPlatformProgressView: LinearProgressView!
    
    @objc func updateProgressViews() {
        streamTVProgressView.animationDuration = 2.0
        streamTVProgressView.barInset = 0.0
        streamTVProgressView.minimumValue = 0
        streamTVProgressView.maximumValue = Float(streamTV.neededTime * 100)
        
        videoPlatformProgressView.animationDuration = 2.0
        videoPlatformProgressView.barInset = 0.0
        videoPlatformProgressView.minimumValue = 0
        videoPlatformProgressView.maximumValue = Float(videoPlatform.neededTime * 100)
    }
    
    @objc func updateLabels() {
        
        videoPlatformStatsLabels[0].text = "\(videoPlatform.popularity)"
        videoPlatformStatsLabels[1].text = "\(videoPlatform.followers)"
        
        if videoPlatform.popularity == 0 && videoPlatform.followers == 0 {
            videoPlatformStatsLabels[2].text = "–"
        } else {
            videoPlatformStatsLabels[2].text = "\(videoPlatform.avgSalary)"
        }
        
        if videoPlatform.startTime {
            videoPlatformLabel.text = videoPlatform.name
            videoPlatformProgressView.isHidden = false
        } else {
            videoPlatformLabel.text = "Video Platform"
            videoPlatformProgressView.isHidden = true
        }
        
        streamTVstatsLabels[0].text = "\(streamTV.popularity)"
        streamTVstatsLabels[1].text = "\(streamTV.followers)"
        
        if streamTV.popularity == 0 && streamTV.followers == 0 {
            streamTVstatsLabels[2].text = "–"
        } else {
            streamTVstatsLabels[2].text = "\(streamTVTransfer.avgSalary)"
        }
        
        if streamTV.startTime {
            streamTVLabel.text = streamTV.name
            streamTVProgressView.isHidden = false
        } else {
            streamTVLabel.text = "Stream TV"
            streamTVProgressView.isHidden = true
        }
    }
    
    @objc func updateProgressView() {
        streamTVProgressView.setProgress(Float(streamTV.mediaTime), animated: true)
        if !streamTV.startTime {
            streamTVProgressView.setProgress(0, animated: true)
            streamTVButtonOutlet.isUserInteractionEnabled = true
            
            let encodedData : Data = NSKeyedArchiver.archivedData(withRootObject: streamTV)
            UserDefaults.standard.set(encodedData, forKey: "StreamTV")
        } else {
            streamTVButtonOutlet.isUserInteractionEnabled = false
        }
        
        videoPlatformProgressView.setProgress(Float(videoPlatform.mediaTime), animated: true)
        if !videoPlatform.startTime {
            videoPlatformProgressView.setProgress(0, animated: true)
            videoPlatformButtonOutlet.isUserInteractionEnabled = true
            
            let encodedData : Data = NSKeyedArchiver.archivedData(withRootObject: streamTV)
            UserDefaults.standard.set(encodedData, forKey: "VideoPlatform")
        } else {
            videoPlatformButtonOutlet.isUserInteractionEnabled = false
        }
        
        updateLabels()
    }
    
    func checkAvgSalary() {
        
        var streamTVAvgDonate = 0
        var videoPlatformAvgSalary = 0
        
        for index in 0...streamTVArr.count - 1 {
            if streamTV.followers % 25 == 0 && streamTV.followers != streamTVLF {
                streamTVArr[index].avgSalary += 1
                streamTVLF = streamTV.followers
                UserDefaults.standard.set(streamTVLF, forKey: "StreamTVLastFollower")
            }
            
            streamTVAvgDonate += streamTVArr[index].avgSalary
        }
        let encodedStreamTVData : Data = NSKeyedArchiver.archivedData(withRootObject: streamTVArr)
        UserDefaults.standard.set(encodedStreamTVData, forKey: "StreamTVArray")
        
        streamTV.avgSalary = streamTVAvgDonate / streamTVArr.count
        
        for index in 0...videoPlatformArr.count - 1 {
            if videoPlatform.followers % 25 == 0 && videoPlatform.followers != videoPlatformLF {
                videoPlatformArr[index].avgSalary += 1
                videoPlatformLF = videoPlatform.followers
                UserDefaults.standard.set(videoPlatformLF, forKey: "VideoPlatformLastFollower")
            }
            
            videoPlatformAvgSalary += videoPlatformArr[index].avgSalary
        }
        let encodedVideoPlatformData : Data = NSKeyedArchiver.archivedData(withRootObject: videoPlatformArr)
        UserDefaults.standard.set(encodedVideoPlatformData, forKey: "VideoPlatformArray")
        
        videoPlatform.avgSalary = videoPlatformAvgSalary / videoPlatformArr.count
        
        updateLabels()
    }
    
}
