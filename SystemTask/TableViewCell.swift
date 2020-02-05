//
//  TableViewCell.swift
//  SystemTask
//
//  Created by THOTA NAGARAJU on 1/27/20.
//  Copyright © 2020 THOTA NAGARAJU. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var textLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
