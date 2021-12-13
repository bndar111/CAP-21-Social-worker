//
//  SocialCell.swift
//  Social worker P.5
//
//  Created by بندر عبيد ثاري الرشيدي on 09/05/1443 AH.
//

import UIKit

class SocialCell: UITableViewCell {
    @IBOutlet weak var socialWorker: UILabel!
    @IBOutlet weak var nameSocial: UILabel!
    @IBOutlet weak var imgPicture: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
