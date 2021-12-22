//
//  PationCell.swift
//  Social worker P.5
//
//  Created by بندر عبيد ثاري الرشيدي on 17/05/1443 AH.
//

import UIKit

class PationCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var masgP: UILabel!
    var patient = Patiosn(name: "", email: "", id: "")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.text = patient.name
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
