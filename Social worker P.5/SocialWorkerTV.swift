//
//  SocialWorkerT.V.swift
//  Social worker P.5
//
//  Created by بندر عبيد ثاري الرشيدي on 09/05/1443 AH.
//

import UIKit
class SocialWorkerTV: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var name = ["Bndar","Reem","Aziz"]
    var specialtySocial = ["SocialWorker","Psychologist","SocialWorker"]
    var imgPicture = [UIImage(named: "img3"),
    UIImage(named: "images1"),
    UIImage(named: "img2")]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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

        // Configure the cell...

        return cell
        }
}
