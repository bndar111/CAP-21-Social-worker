//
//  ViewController.swift
//  Social worker P.5
//  Created by بندر عبيد ثاري الرشيدي on 08/05/1443 AH.
import UIKit
import FirebaseDatabase
import FirebaseFirestore
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var conditions: UILabel!
    @IBOutlet weak var stert: UIButton!
    
    @IBAction func Edit(_ sender: Any) {
        
    }
    let db = Database.database().reference()
    let dbStore = Firestore.firestore()

}
