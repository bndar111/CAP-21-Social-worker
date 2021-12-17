//
//  ChatViewController.swift
//  Social worker P.5
//
//  Created by بندر عبيد ثاري الرشيدي on 10/05/1443 AH.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ChatViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    // name of Doctor
    var reseiver = ""
    
    var messageArr = [Message]()
    @IBOutlet weak var txtMasege: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendMas: UIButton!
    @IBAction func sendMassege(_ sender: UIButton) {
        txtMasege.endEditing(true)
        txtMasege.isEnabled = false
        txtMasege.isEnabled = false
        
        let msgDB = Database.database().reference().child(reseiver)
        let msgDict = ["Sender" : Auth.auth().currentUser?.email,"MessageBody" : txtMasege.text!]
        msgDB.childByAutoId().setValue(msgDict){(error,ref) in
            if (error  != nil){
                debugPrint(error)
            }else{
                debugPrint("Msg saved")
                self.txtMasege.isEnabled = true
                self.sendMas.isEnabled = true
                self.txtMasege.text = nil
            }
        }
    }
    func getMsgs(){
            let msgDB = Database.database().reference().child(reseiver)
            msgDB.observe(.childAdded) { (snapShot) in
                let value = snapShot.value as! Dictionary<String,String>
                let text = value["MessageBody"]!
                let sender = value["Sender"]!
                let msg = Message()
                msg.msgBody = text
                msg.sender = sender
                self.messageArr.append(msg)
                debugPrint(self.messageArr.count)
                self.tableView.reloadData()
            }
        }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messageArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
        cell.UserName.text = messageArr[indexPath.row].sender
        cell.message.text = messageArr[indexPath.row].msgBody
        cell.imageUser.image = UIImage(systemName: "img3")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
        
        getMsgs()
        // Do any additional setup after loading the view.
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
