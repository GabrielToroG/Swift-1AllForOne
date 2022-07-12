//
//  SendDataTableViewCell.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 12-07-22.
//

import UIKit

class SendDataTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorLabel: UILabel!
    
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
