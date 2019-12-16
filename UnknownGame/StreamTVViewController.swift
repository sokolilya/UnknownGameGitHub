//
//  StreamTVViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 27/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import UIKit

class StreamTVViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(dismissVC), name: NSNotification.Name(rawValue: "dismissStreamTV"), object: nil)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
