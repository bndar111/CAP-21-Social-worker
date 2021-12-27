//
//  ChatViewController.swift
//  Social worker P.5
//
//  Created by بندر عبيد ثاري الرشيدي on 10/05/1443 AH.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ChatForSocialWorker: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    let userID = Auth.auth().currentUser!.uid
    var messageArr = [Message]()
    var selectedPatient = Patiosn()
    var socialWorker = Social()
    @IBOutlet weak var txtMasege: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendMas: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
        self.title = selectedPatient.name
        self.messageArr.removeAll()
        print("Fetching messages..")
        getMsgs()
    }
    
    // MARK: Send Chat Message
    @IBAction func sendMassege(_ sender: UIButton) {
        txtMasege.endEditing(true)
        txtMasege.isEnabled = false
        txtMasege.isEnabled = false
        let msgDB = Database.database().reference().child("messages").child(selectedPatient.id)
        let msgDict = ["email" : Auth.auth().currentUser?.email,
                       "sender" : Auth.auth().currentUser?.uid,
                       "message" : txtMasege.text!,
                       "receiver" : selectedPatient.id
        ]
        
        msgDB.childByAutoId().setValue(msgDict){(error,ref) in
            if (error  != nil){
                debugPrint(error)
            } else {
                debugPrint("Msg saved")
                self.txtMasege.isEnabled = true
                self.sendMas.isEnabled = true
                self.txtMasege.text = nil
            }
        }
    }
    
    // MARK: Load all messages from FB
    func getMsgs(){
        let msgDB = Database.database().reference().child("messages").child(selectedPatient.id)
        msgDB.observe(.childAdded) { (snapShot) in
            let msgDictionary = snapShot.value as? [String: String]
            guard let msgDict = msgDictionary else { return }
            let msgObj = Message(sender: msgDict["sender"],
                                 email: msgDict["email"],
                                 receiver: msgDict["receiver"],
                                 message: msgDict["message"])
            
            if (msgDict["sender"] as! String == self.selectedPatient.id &&
                msgDict["receiver"] as! String == Auth.auth().currentUser?.uid) ||
                (msgDict["receiver"] as! String == self.selectedPatient.id &&
                 msgDict["sender"] as! String == Auth.auth().currentUser?.uid) {
                
                self.messageArr.append(msgObj)
            }
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messageArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
        cell.UserName.text = messageArr[indexPath.row].email
        cell.message.text = messageArr[indexPath.row].message
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
}

