//
//  CustomerCell.swift
//  Invitation
//
//  Created by Cris Burlamaqui on 27/05/2020.
//  Copyright © 2020 Cris Burlamaqui. All rights reserved.
//

import UIKit

class CustomerCell: UITableViewCell {
    
    @IBOutlet weak var customerID: UILabel!
    @IBOutlet weak var customerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
