//
//  Edt.swift
//  Social worker P.5
//
//  Created by بندر عبيد ثاري الرشيدي on 24/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class Profile: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var PhoneNamber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readUser()
    }
    func readUser () {
        guard let user = Auth.auth().currentUser?.uid else {
            return
        }
        Database.database().reference(withPath: "users").child(user).observe(.value) { snapshot in
            let value = snapshot.value as? NSDictionary
            let username = value?["UserName"] as! String
            let username1 = value?["signUpPation"] as! String
            let username2 = value?["PhoneNamber"] as! String
            self.name.text = username
            self.email.text = username1
            self.PhoneNamber.text = username2
        }
    }
}
