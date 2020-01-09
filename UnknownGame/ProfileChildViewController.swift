//
//  ProfileChildViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 25.12.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit

class ProfileChildViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateName), name: NSNotification.Name("UpdateName"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setupBioStackView), name: NSNotification.Name("SetupProfileBio"), object: nil)
        
        setupBioStackView()
        updateName()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBOutlet weak var bioStackView: UIStackView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var changeNameButtonOutlet: UIButton!
    @IBAction func changeNameButtonAction(_ sender: UIButton) {
    }
    
}

extension ProfileChildViewController {
    
    @objc func setupBioStackView() {
        
        
        
        player.bio.forEach { v in
            
            if let bioView = Bundle.main.loadNibNamed("BioView", owner: self, options: nil)?.first as? BioView {
                
                bioView.frame.size.height = 40
                
                if v.imageName != "" && v.imageName != "questionMark" {
                    bioView.bioImageView.image = UIImage(named: v.imageName)
                } else {
                    bioView.bioImageView.image = UIImage(named: "questionMark")
                }
                bioView.bioNameLabel.text = v.name
                bioView.bioInfoLabel.text = v.info
                
                
                bioStackView.distribution = .fillEqually
                bioStackView.addArrangedSubview(bioView)
                
                let height = bioStackView.heightAnchor.constraint(equalToConstant: 220)
                height.isActive = true
                
                bioView.layoutIfNeeded()
            }
        }
        
    }
    
    @objc func updateName() {
        profileNameLabel.text = player.name
    }
    
}
