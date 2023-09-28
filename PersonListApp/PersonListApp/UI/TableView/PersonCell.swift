//
//  PersonCell.swift
//  PersonListApp
//
//  Created by Burak Aydın on 18.09.2023.
//

import UIKit

class PersonCell: UITableViewCell {
    
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var phoneNoTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
