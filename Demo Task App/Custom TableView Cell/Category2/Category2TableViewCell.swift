//
//  Category1TableViewCell.swift
//  Demo Task App
//
//  Created by apple on 04/07/21.
//

import UIKit

class Category2TableViewCell: UITableViewCell{
    @IBOutlet weak var impLinkLbl : UILabel!
    @IBOutlet weak var viewAllButton : UIButton!
    var responseArr = Array<Any>()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewAllButton.addTarget(self, action: #selector(viewAllButtonTapped(_:)), for: .touchUpInside)
    }
    func setData(dict: Dictionary<String,Any>) -> Void {
        if let title1 = dict["title"] {
            self.impLinkLbl.text = (title1 as! String)
        }
    }
    // Selector Methods of Category 2
    @objc func viewAllButtonTapped(_ sender: UIButton) {
        let dict = self.responseArr[1] as! Dictionary<String,Any>
        if let navigate1 = dict["navigate"] {
            UIApplication.shared.open(URL(string: navigate1 as! String)!, options: [:], completionHandler: nil)
        }
    }
}
