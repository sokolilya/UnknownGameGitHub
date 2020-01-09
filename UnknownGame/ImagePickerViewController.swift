//
//  ImagePickerViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 28.12.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit

class ImagePickerViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(dismissImagePicker), name: NSNotification.Name("dismissImagePicker"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(switchSegmentedController), name: NSNotification.Name("SwitchSegmentedController"), object: nil)
        
        setupBackground()
    }
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedController: UISegmentedControl!
    @IBAction func segmentSwitched(_ sender: UISegmentedControl) {
        collectionView.reloadData()
    }
    @IBAction func dismissButton(_ sender: UIButton) {
        closeImagePicker(button: sender)
    }
    
    @objc func dismissImagePicker() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupBackground() {
        let modelName = UIDevice.modelName
        
        switch modelName {
        case "iPhone X", "iPhone XS", "iPhone XS Max", "iPhone XR", "iPhone 11", "iPhone 11 Pro", "iPhone 11 Pro Max":
            backgroundImageView.image = UIImage(named: "background_15_11")
        default:
            backgroundImageView.image = UIImage(named: "background_15_8")
        }
    }
    
    func closeImagePicker(button: UIButton) {
        UIView.animate(withDuration: 0.3, animations: {
            button.transform = button.transform.rotated(by: -.pi/2)
        }) { (_) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

extension ImagePickerViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var number = 0
        
        segmentedControllerIndex = segmentedController.selectedSegmentIndex
        
        switch segmentedControllerIndex {
        case 0:
            number = placeholderImages.count
        case 1:
            number = placeholderBackgroundImages.count
        default:
            break
        }
        
        return number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImagePickerViewCell
        
        switch segmentedControllerIndex {
        case 0:
            choosePlaceholderImage(cell: cell, indexPath: indexPath)
        case 1:
            choosePlaceholderBackgroundImage(cell: cell, indexPath: indexPath)
        default:
            break
        }
        
        cell.imageView.layer.cornerRadius = 10.0
            
        return cell
    }
    
    func choosePlaceholderImage(cell: ImagePickerViewCell, indexPath: IndexPath) {
        cell.imageView.image = UIImage(named: placeholderImages[indexPath.row])
        cell.imagePIndex = indexPath.row
    }
    
    func choosePlaceholderBackgroundImage(cell: ImagePickerViewCell, indexPath: IndexPath) {
        cell.imageView.image = UIImage(named: placeholderBackgroundImages[indexPath.row])
        cell.imagePBIndex = indexPath.row
    }
    
    @objc func switchSegmentedController() {
        if placeholderBackgroundImageIndex == -1 {
            segmentedController.selectedSegmentIndex = 1
        } else if placeholderImageIndex == -1 {
            segmentedController.selectedSegmentIndex = 0
        }
        
        segmentSwitched(segmentedController)
    }
    
}
