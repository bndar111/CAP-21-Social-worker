//
//  RegisterVC.swift
//  Social worker P.5
//
//  Created by بندر عبيد ثاري الرشيدي on 09/05/1443 AH.
//

import Foundation
import FirebaseAuth
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
    
    //signUpPation
 
    @IBOutlet weak var signUpPation: UITextField!
    @IBOutlet weak var pasworedsignUpPation: UITextField!
    @IBAction func siginUpPation(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: signUpPation.text!, password: pasworedsignUpPation.text!) {Result, error in
            
            if (error == nil) {
                print(Result?.user.email ?? "no email")
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
