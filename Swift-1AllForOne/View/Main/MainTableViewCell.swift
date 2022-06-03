//
//  MainTableViewCell.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 28-05-22.
//

import UIKit

//MARK: - 1 MainTableViewCell
class MainTableViewCell: UITableViewCell {

    
    //MARK: 1.1 Outlets
    @IBOutlet weak var tableIcon: UIImageView!
    @IBOutlet weak var tableName: UILabel!
    
    
    //MARK: 1.3 Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    //MARK: 1.4 Actions
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
