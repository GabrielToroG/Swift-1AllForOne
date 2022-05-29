//
//  TestingTableViewCell.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 27-05-22.
//

import UIKit

class TestingTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!

    @IBOutlet weak var labelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
