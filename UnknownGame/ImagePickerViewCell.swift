//
//  ImagePickerView.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 28.12.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit

class ImagePickerViewCell : UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectImageButton: UIButton!
    @IBAction func imageSelected(_ sender: UIButton) {
        updatePlaceholderView()
    }
    
    @IBAction func touchCancel(_ sender: UIButton) {
        
    }
    
    @IBAction func touchStart(_ sender: UIButton) {
        
    }
    
    var imagePIndex : Int = -1
    var imagePBIndex : Int = -1
    
    func updatePlaceholderView() {
        if segmentedControllerIndex == 0 {
            placeholderImageIndex = imagePIndex
        }
        
        if segmentedControllerIndex == 1 {
            placeholderBackgroundImageIndex = imagePBIndex
        }
        
        if placeholderImageIndex != -1 && placeholderBackgroundImageIndex != -1 {
            NotificationCenter.default.post(name: NSNotification.Name("changePlaceHolderImage"), object: nil)
            NotificationCenter.default.post(name: NSNotification.Name("changePlaceHolderBackgroundImage"), object: nil)
            
            NotificationCenter.default.post(name: NSNotification.Name("dismissImagePicker"), object: nil)
        } else {
            NotificationCenter.default.post(name: NSNotification.Name("SwitchSegmentedController"), object: nil)
        }
    }
    
}
