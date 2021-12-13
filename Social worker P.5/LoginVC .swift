//
//  Login .swift
//  Social worker P.5
//
//  Created by بندر عبيد ثاري الرشيدي on 08/05/1443 AH.
//

import Foundation
import FirebaseAuth
import UIKit

class LoginSocialWorker : UIViewController {
    // Social worker sigin in
    @IBOutlet weak var pasowerdSocial: UITextField!
    @IBOutlet weak var emailSocial: UITextField!
    @IBAction func signInSocial(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailSocial.text!, password: pasowerdSocial.text!) {Result, error in
            if (error == nil) {
                print(Result?.user.email ?? "")
                let x = self.storyboard?.instantiateViewController(withIdentifier: "loginin") as! ViewController
                self.present(x, animated: true, completion: nil)
            }else{
                print(error?.localizedDescription)
            }
        }
    }
  
}
class LoginPation : UIViewController {
    // Pation sign in
    @IBOutlet weak var emailPation: UITextField!
    @IBOutlet weak var pasowerdPation: UITextField!
    @IBAction func signInPation(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailPation.text!, password: pasowerdPation.text!) {Result, error in
            if (error == nil) {
                print(Result?.user.email ?? "")
                let x = self.storyboard?.instantiateViewController(withIdentifier: "roles") as! ViewController
                self.present(x, animated: true, completion: nil)
            }else{
                print(error?.localizedDescription)
            }
        }
        
    }
    
}

