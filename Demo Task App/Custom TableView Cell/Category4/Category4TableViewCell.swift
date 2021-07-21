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

    func setData(dict: Dictionary<String,Any>) -> Void {
        lblTag.text = dict["tag"] as? String ?? ""
        lblTitle.text = dict["title"] as? String ?? ""
        lblsubTitle.text = dict["subtitle"] as? String ?? ""
        lblTime.text = dict["hcard_tag_01"] as? String ?? ""
        lblPhase.text = dict["hcard_tag_02"] as? String ?? ""
        selectionStyle = .none
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
