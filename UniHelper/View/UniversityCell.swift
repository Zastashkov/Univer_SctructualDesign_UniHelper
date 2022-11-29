//
//  UniversityCell.swift
//  UniHelper
//
//  Created by Danila Belyi on 28.11.2022.
//

import UIKit

class UniversityCell: UITableViewCell {
    var delegate: UniversityCellDelegator!
    @IBOutlet weak var universityLogo: UIImageView!
    @IBOutlet weak var universityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
