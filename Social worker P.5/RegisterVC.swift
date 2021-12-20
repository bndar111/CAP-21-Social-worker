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

//class ReigsterSocialWorker : UIViewController {
//    //signUp Social
//       @IBOutlet weak var signUpSocial: UITextField!
//       @IBOutlet weak var pasowerdSocial: UITextField!
//       @IBAction func signUpSocial(_ sender: UIButton) {
//
//           Auth.auth().createUser(withEmail: signUpSocial.text!, password: pasowerdSocial.text!) {Result, error in
//
//               if (error == nil) {
//                   print(Result?.user.email ?? "no email")
//               }else{
//                   print(error?.localizedDescription ?? "")
//               }
//           }
//       }
//}


class ReigsterPation : UIViewController {
    var userID : String?
    //signUpPation
    @IBOutlet weak var PhoneNamber: UITextField!
    @IBOutlet weak var UserName: UITextField!
    
    @IBOutlet weak var signUpPation: UITextField!
    @IBOutlet weak var pasworedsignUpPation: UITextField!
    @IBAction func siginUpPation(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: signUpPation.text!, password: pasworedsignUpPation.text!) {authResult, error in
            self.userID = authResult!.user.uid
            let a = ["PhoneNamber":self.PhoneNamber.text!,
                     "UserName":self.UserName.text!,
                     "signUpPation":self.signUpPation.text!,
                     "pasworedsignUpPation":self.pasworedsignUpPation.text!,
                     "UID":authResult!.user.uid
            ]
            Database.database().reference().child("users").child(authResult!.user.uid)
                .setValue(a)

            if (error == nil) {
                print(authResult?.user.email ?? "no email")
            }else{
                print(error?.localizedDescription ?? "")
            }
            }
        }
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
