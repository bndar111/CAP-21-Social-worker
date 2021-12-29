////
////  EditViewController.swift
////  Social worker P.5
////
////  Created by بندر عبيد ثاري الرشيدي on 25/05/1443 AH.
////
//
//import UIKit
//import Firebase
//
//class EditViewController: UIViewController {
//    @IBOutlet weak var Name: UITextField!
//    
//    @IBOutlet weak var Email: UITextField!
//  
//    
//   
//    @IBAction func Edit(_ sender: Any) {
//        var b = ["UserName":Name.text!,"signUpPation":Email.text!]
//        Database.database().reference(withPath:"users").updateChildValues(b)
//    }
//            
//        
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
