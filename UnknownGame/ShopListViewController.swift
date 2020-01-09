//
//  ShopListViewController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 29.12.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit

class ShopListViewController : UIViewController {
    
    var data : [ProductModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(selectShopName), name: NSNotification.Name("SelectShopName"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateShopDollaresLabel), name: NSNotification.Name("UpdateShopDollaresLabel"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(chooseStoreData), name: NSNotification.Name("ChooseStoreData"), object: nil)
        
        setupUI()
    }
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var dollarsLabel: UILabel!
    @IBAction func backButton(_ sender: UIButton) {
        closeShop(button: sender)
    }
    
    @objc func selectShopName() {
        shopName.text = toShop_Name
    }
    
    @objc func updateShopDollaresLabel() {
        dollarsLabel.text = String(dollars) + "$"
    }
    
    func closeShop(button: UIButton) {
        UIView.animate(withDuration: 0.3, animations: {
            button.transform = button.transform.rotated(by: -.pi/2)
        }) { (_) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

extension ShopListViewController : UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shopCell", for: indexPath) as! ShopListCollectionViewCell
        
        cell.productImageView.image = UIImage(named: data[indexPath.row].imageName)
        cell.productNameLabel.text = data[indexPath.row].name
        cell.productBioLabel.text = data[indexPath.row].bio
        cell.productCostLabel.text = String(data[indexPath.row].cost) + "$"
        cell.heightAnchor.constraint(equalToConstant: 200).isActive = true
        cell.widthAnchor.constraint(equalToConstant: 120).isActive = true
        cell.selectProductButtonOutlet.tag = indexPath.row
        
        return cell
    }
    
    @objc func chooseStoreData() {
        switch shopIndex {
        case 0:
            data = product_phone
        case 1:
            data = product_pc
        case 2:
            data = product_realty
        case 3:
            data = product_transport
        default:
            break
        }
    }

}

extension ShopListViewController {
    
    func setupUI() {
        let modelName = UIDevice.modelName
        
        switch modelName {
        case "iPhone X", "iPhone XS", "iPhone XS Max", "iPhone XR", "iPhone 11", "iPhone 11 Pro", "iPhone 11 Pro Max":
            backgroundImageView.image = UIImage(named: "background_15_11")
        default:
            backgroundImageView.image = UIImage(named: "background_15_8")
        }
    }
    
}
