//
//  Notifications.swift
//  Social worker P.5
//
//  Created by بندر عبيد ثاري الرشيدي on 15/05/1443 AH.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Patiosn   {
    var name : String = ""
    var email : String = ""
    var id : String = ""
}
class PationVC: UITableViewController {
    var arrPation = [Patiosn]()
    
    @IBAction func update(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Edit") as! UpdateSocial
        vc.social.TypeSocial
        vc.social.NameSocial
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getMsgs()
    }
    
    func getMsgs(){
        let messagesDB = Database.database().reference().child("messages")
        messagesDB.observe(.value) { messagesSnapshot in
            for (key, child) in messagesSnapshot.children.enumerated() {
                let userMessage = child as! DataSnapshot
                print(userMessage.value)
                
                for (key, message) in userMessage.children.enumerated() {
                    let messageByUser = message as! DataSnapshot
                    let messageDict = messageByUser.value as? [String: Any]
                    print(messageDict?["receiver"] as! String == Auth.auth().currentUser!.uid)
                    if messageDict?["receiver"] as! String == Auth.auth().currentUser!.uid {
                        let userRef = Database.database().reference().child("users").child(messageDict?["sender"] as! String)
                        userRef.getData { err, userSnapshot in
                            let userDict = userSnapshot.value as? [String: String]
                            print(userDict?["UserName"])
                            let a1 = userDict?["UID"] ?? ""
                            let a2 = userDict?["UserName"] ?? ""
                            let a3 = userDict?["signUpPation"] ?? ""
                            var client = Patiosn()
                            client.id = a1
                            client.name = a2
                            client.email = a3
                            if (self.arrPation.contains(where: {$0.id == client.id}) == false) {
                                self.arrPation.append(client)
                            }
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                    
                }
                
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
