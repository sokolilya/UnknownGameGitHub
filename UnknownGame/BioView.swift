//
//  bioView.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 25.12.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import UIKit

class BioView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBOutlet weak var bioImageView: UIImageView!
    @IBOutlet weak var bioNameLabel: UILabel!
    @IBOutlet weak var bioInfoLabel: UILabel!
    @IBOutlet weak var viewForImageView: UIView!
    
}
