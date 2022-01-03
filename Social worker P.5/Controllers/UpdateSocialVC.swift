//
//  Edit.swift
//  Social worker P.5
//
//  Created by بندر عبيد ثاري الرشيدي on 25/05/1443 AH.
//

import UIKit
import Firebase

class UpdateSocial: UIViewController {
    let dbStore = Firestore.firestore()
    var social = Social()
    @IBOutlet weak var nameSocial: UITextField!
    @IBOutlet weak var TypeSocial: UITextField!
    @IBAction func sendBtn(_ sender: UIButton) {
        dbStore.collection("Social").document(Auth.auth().currentUser!.uid).setData(["NameSocial" : nameSocial.text!,"TypeSocial":TypeSocial.text!],merge: true)
    }
    func getSocial () {
        dbStore.collection("Social").whereField("id", isEqualTo: Auth.auth().currentUser!.uid)
            .getDocuments { snapshot, err in
                guard let snapshot1 = snapshot else {return}
                let data = snapshot1.documents.first!.data()
                let nameSocial = (data["NameSocial"]!) as! String
                let TypeSocial = (data["TypeSocial"]!) as! String
                self.nameSocial.text! = nameSocial
                self.TypeSocial.text! = TypeSocial
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSocial()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
