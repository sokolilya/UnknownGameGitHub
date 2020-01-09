//
//  ChangeNamePopupViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 27.12.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit

class ChangeNamePopupViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBOutlet weak var changeNameTitle: UILabel!
    @IBOutlet weak var changeNameTextField: UITextField!
    @IBOutlet weak var changeNameButtonOutlet: UIButton!
    @IBOutlet weak var buttonView: UIView!
    @IBAction func changeNameButtonAction(_ sender: Any) {
        checkNewName()
    }
    @IBAction func dismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func checkNewName() {
        
        if changeNameTextField.text == "" || changeNameTextField.text == nil  {
            animateSaveButton()
        } else {
            saveNewName(name: changeNameTextField.text ?? "")
        }
    }
    
    func animateSaveButton() {
        buttonView.shake(duration: 0.6)
    }
    
    func saveNewName(name: String) {
        player.name = name
        NotificationCenter.default.post(name: NSNotification.Name("UpdateName"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name("SavePlayerProfile"), object: nil)
        self.dismiss(animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= 50
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
}
