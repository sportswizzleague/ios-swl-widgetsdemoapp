//
//  CustomTableViewCell.swift
//  WebView
//
//  Created by SWL Mohali1 on 31/05/19.
//  Copyright © 2019 SWL Mohali1. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var cutomLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
