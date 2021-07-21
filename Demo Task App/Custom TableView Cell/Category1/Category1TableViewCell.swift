//
//  Category1TableViewCell.swift
//  Demo Task App
//
//  Created by apple on 04/07/21.
//

import UIKit

protocol PopUpMethods: class {
     func showPopUpView(imageUrl: String)
    }



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
    var responseArr = Array<Any>()
    var classDelegat: PopUpMethods?
    var newDict = Dictionary<String,Any>()

    func setCategory1Data(dict: Dictionary<String,Any>) {
         if let title1 = dict["hcard_title_01"] {
            txt1.text = (title1 as? String ?? "")
         }
         if let title1 = dict["hcard_title_01"] {
             self.txt1.text = (title1 as? String ?? "")
         }
         if let title2 = dict["hcard_title_02"] {
            self.txt2.text = (title2 as? String ?? "")
         }
         if let title3 = dict["hcard_title_03"] {
            self.txt3.text = (title3 as? String ?? "")
         }
         
         if let image1 = dict["hcard_bgimg_01"] {
            self.image1.sd_setImage(with: URL(string: image1 as! String), placeholderImage: nil)
         }
         if let image2 = dict["hcard_bgimg_02"] {
            self.image2.sd_setImage(with: URL(string: image2 as! String), placeholderImage: nil)
         }
         if let image3 = dict["hcard_bgimg_03"] {
            self.image3.sd_setImage(with: URL(string: image3 as! String), placeholderImage: nil)
         }
         self.button1.addTarget(self, action: #selector(Btn1Tapped(_:)), for: .touchUpInside)
         self.button2.addTarget(self, action: #selector(Btn2Tapped(_:)), for: .touchUpInside)
         self.button3.addTarget(self, action: #selector(Btn3Tapped(_:)), for: .touchUpInside)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    /************************Custom Button Click Events *******************/
    @objc func Btn1Tapped(_ sender: UIButton) {
        print("Btn1 tapped")
        let dict = self.responseArr[0] as! Dictionary<String,Any>
        if let navigate1 = dict["hcard_navigate_01"] {
            
            let finalUrl = Navigation.getNavigationUrl(stringUrl: navigate1 as! String)
             print(finalUrl)
             self.classDelegat?.showPopUpView(imageUrl: dict["hcard_bgimg_01"] as! String)
           // UIApplication.shared.open(URL(string: navigate1 as! String)!, options: [:], completionHandler: nil)
        }
    }
    
    @objc func Btn2Tapped(_ sender: UIButton) {
        print("Btn2 tapped")
        let dict = self.responseArr[0] as! Dictionary<String,Any>
        if let navigate2 = dict["hcard_navigate_02"] {
            UIApplication.shared.open(URL(string: navigate2 as! String)!, options: [:], completionHandler: nil)
        }
    }
    @objc func Btn3Tapped(_ sender: UIButton) {
        print("Btn3 tapped")
        let dict = self.responseArr[0] as! Dictionary<String,Any>
        if let navigate3 = dict["hcard_navigate_03"] {
            UIApplication.shared.open(URL(string: navigate3 as! String)!, options: [:], completionHandler: nil)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
