//
//  SocialWorkerT.V.swift
//  Social worker P.5
//
//  Created by بندر عبيد ثاري الرشيدي on 09/05/1443 AH.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class SocialWorkerTV: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    var arrSocial = [Social]()
    let dbStore = Firestore.firestore()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        let so = dbStore.collection("Social")
        so.getDocuments() { (querySnapshot, err) in
            for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
                let values = document.data()
                let a1 = values["NameSocial"]
                let a2 = values["EmailSocial"]
                let a3 = values["TypeSocial"]
                let a4 = values["id"]
                let a5 = values["image"]
                let nn = Social(NameSocial: a1 as! String, EmailSocial: a2 as! String, TypeSocial: a3 as! String, id: document.documentID, image: a5 as! String)
                self.arrSocial.append(nn)
            }
            print(self.arrSocial.count)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nip = UINib(nibName: "ChatTableViewCell", bundle: nil)
        tableView.register(nip, forCellReuseIdentifier: "ChatTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSocial.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Firstsl", for: indexPath) as! SocialCell
        cell.nameSocial.text = arrSocial[indexPath.row].NameSocial
        cell.socialWorker.text = arrSocial[indexPath.row].TypeSocial
        let imageURL = URL(string: arrSocial[indexPath.row].image)!
        URLSession.shared.dataTask(with: imageURL)
        let data = try? Data(contentsOf: imageURL)
        cell.imgPicture.image = UIImage(data: data!)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "chatSegue") as! ChatViewController
        vc.socialWorker = arrSocial[indexPath.row]
        print("you select me")
        self.navigationController?.show(vc, sender: nil)
    }
}

