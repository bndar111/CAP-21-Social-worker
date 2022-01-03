//
//  RegisterVC.swift
//  Social worker P.5
//
//  Created by بندر عبيد ثاري الرشيدي on 09/05/1443 AH.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import UIKit

class ReigsterPation : UIViewController {
    var userID : String?
    //signUpPation
    @IBOutlet weak var PhoneNamber: UITextField!
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var signUpPation: UITextField!
    @IBOutlet weak var pasworedsignUpPation: UITextField!
    @IBAction func siginUpPation(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: signUpPation.text!, password: pasworedsignUpPation.text!) {authResult, error in
            
            if (error == nil) {
                self.userID = authResult?.user.uid
                let a = ["PhoneNamber":self.PhoneNamber.text!,
                         "UserName":self.UserName.text!,
                         "signUpPation":self.signUpPation.text!,
                         "pasworedsignUpPation":self.pasworedsignUpPation.text!,
                         "UID":authResult!.user.uid,
                         "patient": "1"
                ]
                Database.database().reference().child("users").child(authResult!.user.uid)
                    .setValue(a)
               
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "signnedIn") as! ViewController
                   
            self.navigationController?.pushViewController(vc, animated: true)
                print(error?.localizedDescription ?? "")
//                print(authResult?.user.email ?? "no email")
            }
            else{ print(error?.localizedDescription)}
        }
            
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
    
