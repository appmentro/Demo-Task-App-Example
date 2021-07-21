//
//  PopUPViewController.swift
//  Demo Task App
//
//  Created by apple on 19/07/21.
//

import UIKit

class PopUPViewController: UIViewController, UIAlertViewDelegate {
    @IBOutlet weak var image1 : UIImageView!
    var imageStr = String()


    override func viewDidLoad() {
        super.viewDidLoad()
        print(imageStr)
        self.image1.sd_setImage(with: URL(string: imageStr ), placeholderImage: nil)
        self.alert(message: imageStr, title: "Hello")


    }
    
}
