//
//  FreelanceViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 11/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit

class FreelanceViewController: UIViewController {
    
    var freelanceSwitchCase = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        freelanceSwitchCase = 4
        if hasFreelance {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "entryLevel" || segue.identifier == "intermediate" || segue.identifier == "expert" || segue.identifier == "takeJob" {
            let vc: FreelanceJobListViewController = segue.destination as! FreelanceJobListViewController
            vc.freelanceSwitchCase = freelanceSwitchCase
        }
    }
    
    @IBOutlet weak var backButtonOutlet: UIButton!
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func entryLevelButtonAction(_ sender: Any) {
        freelanceSwitchCase = 1
    }
    @IBAction func intermediateButtonAction(_ sender: Any) {
        freelanceSwitchCase = 2
    }
    @IBAction func expertButtonAction(_ sender: Any) {
        freelanceSwitchCase = 3
    }
    @IBAction func takeJobButtonAction(_ sender: Any) {
        freelanceSwitchCase = 4
    }
    
}
