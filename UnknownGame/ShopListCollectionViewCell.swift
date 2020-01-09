//
//  CollectionViewCell.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 29.12.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import UIKit

class ShopListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productBioLabel: UILabel!
    @IBOutlet weak var productCostLabel: UILabel!
    @IBOutlet weak var selectProductButtonOutlet: UIButton!
    @IBAction func selectProductButtonAction(_ sender: UIButton) {
        buyProduct(sender: sender)
    }
    
    func buyProduct(sender: UIButton) {
        switch shopIndex {
        case 0:
            buyPhone(index: sender.tag)
        case 1:
            buyPC(index: sender.tag)
        case 2:
            buyRealty(index: sender.tag)
        case 3:
            buyTransport(index: sender.tag)
        default:
            break
        }
    }
    
    func buyPhone(index: Int) {
        if dollars >= product_phone[index].cost {
            print(shopIndex)
            print(index)
            dollars -= product_phone[index].cost
            player.bio[shopIndex].name = product_phone[index].name
            player.bio[shopIndex].imageName = product_phone[index].imageName
            player.bio[shopIndex].info = product_phone[index].bio
            product_phone[index].isBuyed = true
            savePlayerProfile()
            print(player.bio[shopIndex].name)
        }
    }
    
    func buyPC(index: Int) {
        if dollars >= product_pc[index].cost {
            dollars -= product_pc[index].cost
            player.bio[shopIndex].name = product_pc[index].name
            player.bio[shopIndex].imageName = product_pc[index].imageName
            player.bio[shopIndex].info = product_pc[index].bio
            product_pc[index].isBuyed = true
            savePlayerProfile()
        }
    }
    
    func buyRealty(index: Int) {
        if dollars >= product_realty[index].cost {
            dollars -= product_realty[index].cost
            player.bio[shopIndex].name = product_realty[index].name
            player.bio[shopIndex].imageName = product_realty[index].imageName
            player.bio[shopIndex].info = product_realty[index].bio
            product_realty[index].isBuyed = true
            savePlayerProfile()
        }
    }
    
    func buyTransport(index: Int) {
        if dollars >= product_transport[index].cost {
            dollars -= product_transport[index].cost
            player.bio[shopIndex].name = product_transport[index].name
            player.bio[shopIndex].imageName = product_transport[index].imageName
            player.bio[shopIndex].info = product_transport[index].bio
            product_transport[index].isBuyed = true
            savePlayerProfile()
        }
    }
    
    func savePlayerProfile() {
        let encodedProfile = NSKeyedArchiver.archivedData(withRootObject: player)
        UserDefaults.standard.set(encodedProfile, forKey: "ProfileData")
        NotificationCenter.default.post(name: NSNotification.Name("SetupProfileBio"), object: nil)
    }
    
}
