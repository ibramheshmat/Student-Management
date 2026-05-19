//
//  ViewController.swift
//  SM
//
//  Created by IBRAM on 1/31/19.
//  Copyright © 2019 IBRAM. All rights reserved.
//  hello learn 

import UIKit
import CoreData
class mainView: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {

    
    var logoImage = ["1","2","3","4","5"]
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //for make admin
        ////////
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
            newUser.setValue("admin", forKey: "name")
            newUser.setValue("admin", forKey: "email")
            newUser.setValue("admin", forKey: "password")
            newUser.setValue("1", forKey: "kind")
            do {
                try context.save()
            }catch{
                print(error)
            }
        collectionView.delegate=self
        collectionView.dataSource=self
        getUserKind()
        navigationItem.hidesBackButton = true 
    
    }
    //for know user kind
    struct globalVar {
        static var userKind = 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return logoImage.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
     cell.imgView.image = UIImage(named: String(logoImage[indexPath.row]))

        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if logoImage[indexPath.row] == "1" {
            performSegue(withIdentifier: "showstudents", sender: nil)
        }else if logoImage[indexPath.row] == "2" {
            performSegue(withIdentifier: "jobShow", sender: nil)
        }else if logoImage[indexPath.row] == "3" {
            performSegue(withIdentifier: "login", sender: nil)
        }else if logoImage[indexPath.row] == "4" {
            performSegue(withIdentifier: "adding", sender: nil)
        }else if logoImage[indexPath.row] == "5" {
            globalVar.userKind = 0 
            _ = navigationController?.popToRootViewController(animated: true)
        }
    }
    func getUserKind () {
        let userKind = globalVar.userKind
        if userKind == 1{
            logoImage = [self.logoImage[0],self.logoImage[1],self.logoImage[3],self.logoImage[4]]
        }else if userKind == 0 {
            logoImage = [self.logoImage[0],self.logoImage[1],self.logoImage[2]]
        }else {
            logoImage = [self.logoImage[0],self.logoImage[1],self.logoImage[2]]
        }
    }


}

