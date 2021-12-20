//
//  SocialWorkerT.V.swift
//  Social worker P.5
//
//  Created by بندر عبيد ثاري الرشيدي on 09/05/1443 AH.
//

import UIKit
import FirebaseFirestore

class SocialWorkerTV: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var name = ["Bndar","Reem","Aziz"]
    var specialtySocial = ["SocialWorker","Psychologist","Social"]
    var imgPicture = [UIImage(named: "img3"),
    UIImage(named: "images1"),
    UIImage(named: "img2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nip = UINib(nibName: "ChatTableViewCell", bundle: nil)
        tableView.register(nip, forCellReuseIdentifier: "ChatTableViewCell")
    }

    
    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "Firstsl", for: indexPath) as! SocialCell
            cell.nameSocial.text = name[indexPath.row]
            cell.socialWorker.text = specialtySocial[indexPath.row]
            cell.imgPicture.image = imgPicture[indexPath.row]
        return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "chatSegue", sender: nil)
        let vc = storyboard?.instantiateViewController(withIdentifier: "chatSegue") as! ChatViewController
        vc.reseiver = self.specialtySocial[indexPath.row]
        print("you select me")
        self.navigationController?.show(vc, sender: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
}

