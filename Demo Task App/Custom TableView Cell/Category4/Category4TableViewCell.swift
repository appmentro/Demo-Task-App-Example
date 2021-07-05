//
//  Category4TableViewCell.swift
//  Demo Task App
//
//  Created by Vaibhav Awasthi on 04/07/21.
//

import UIKit

class Category4TableViewCell: UITableViewCell {
    @IBOutlet weak var lblTag: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblsubTitle: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblPhase: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
