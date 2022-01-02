//
//  Login .swift
//  Social worker P.5
//
//  Created by بندر عبيد ثاري الرشيدي on 08/05/1443 AH.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import UIKit

class LoginSocialWorker : UIViewController {
    let isSocialWorker = true
    
    // Social worker sigin in
    @IBOutlet weak var pasowerdSocial: UITextField!
    @IBOutlet weak var emailSocial: UITextField!
    
    func showAlert(_ msg: String){
        let alertController = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            DispatchQueue.main.async {
              self.present(alertController, animated: true, completion: nil)
            }
    }
    @IBAction func signInSocial(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailSocial.text!, password: pasowerdSocial.text!) {Result, error in
            if (error == nil) {
                self.performSegue(withIdentifier: "chatID2", sender: self)
                print(Result?.user.email ?? "no email")
            }else{
                self.showAlert(error?.localizedDescription ?? "")
            }
        }
    }
}
class LoginPation : UIViewController {
    let dbStore = Firestore.firestore()
    let isSocialWorker = false
    // Pation sign in
    @IBOutlet weak var emailPation: UITextField!
    @IBOutlet weak var pasowerdPation: UITextField!
    func showAlert(_ msg: String){
        let alertController = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            DispatchQueue.main.async {
              self.present(alertController, animated: true, completion: nil)
            }
    }
    @IBAction func signInPation(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailPation.text!, password: pasowerdPation.text!) {Result, error in
            if (error == nil) {
                self.performSegue(withIdentifier: "signnedIn", sender: self)
                print(Result?.user.email ?? "no email")
            }else{
                self.showAlert(error?.localizedDescription ?? "")
            }
        }
    }
}


