//
//  Notifications.swift
//  Social worker P.5
//
//  Created by بندر عبيد ثاري الرشيدي on 15/05/1443 AH.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

struct Patiosn   {
    var name : String = ""
    var email : String = ""
    var id : String = ""
}
class PationVC: UITableViewController {
    var arrPation = [Patiosn]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getMsgs()
    }
    
    func getMsgs(){
        let msgDB = Database.database().reference().child("users")
        msgDB.observe(.childAdded) { (snapShot) in
            let msgDictionary = snapShot.value as? [String: String]
            guard let msgDict = msgDictionary else { return }
            let a1 = msgDict["UID"] ?? ""
            let a2 = msgDict["UserName"] ?? ""
            let a3 = msgDict["signUpPation"] ?? ""
            let patientObj = Patiosn(name: a2, email: a3, id: a1)
            
            if a1 as! String == Auth.auth().currentUser!.uid {
                self.arrPation.append(patientObj)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPation.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! PationCell
        cell.nameLabel.text = arrPation[indexPath.row].name
        cell.masgP.text = arrPation[indexPath.row].email
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "chat_patient") as! ChatForSocialWorker
        vc.selectedPatient = arrPation[indexPath.row]
        self.navigationController?.show(vc, sender: nil)
    }
    
    
}

