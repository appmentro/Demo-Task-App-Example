//
//  Category1TableViewCell.swift
//  Demo Task App
//
//  Created by apple on 04/07/21.
//

import UIKit

class Category1TableViewCell: UITableViewCell {
    //Declare ImageView
    @IBOutlet weak var image1 : UIImageView!
    @IBOutlet weak var image2 : UIImageView!
    @IBOutlet weak var image3 : UIImageView!
    
    //Declare Title Lable
    @IBOutlet weak var txt1: UITextView!
    @IBOutlet weak var txt2: UITextView!
    @IBOutlet weak var txt3: UITextView!

    //Declare Navigate Button
    @IBOutlet weak var button1 : UIButton!
    @IBOutlet weak var button2 : UIButton!
    @IBOutlet weak var button3 : UIButton!
    
    
    



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
