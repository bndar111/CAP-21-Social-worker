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
    @IBOutlet weak var PhoneNamber: UITextField!
    @IBOutlet weak var UserName: UITextField!
    
    @IBOutlet weak var signUpPation: UITextField!
    @IBOutlet weak var pasworedsignUpPation: UITextField!
    @IBAction func siginUpPation(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: signUpPation.text!, password: pasworedsignUpPation.text!) {Result, error in
            
          
                if error != nil{
           //                 disply error
                  var alertVC = UIAlertController(title: "Error", message: "Pation register success", preferredStyle: .alert)
                           alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler:nil))
                           self.present(alertVC, animated: true, completion: nil)
                       }else{
           //                success
                           var alertVC = UIAlertController(title: "Pation register success", message:  error?.localizedDescription, preferredStyle: .alert )
                           alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler:nil))
                           self.present(alertVC, animated: true, completion: nil)
                       }
            }
        }
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
