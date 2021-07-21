//
//  Navigation.swift
//  Demo Task App
//
//  Created by apple on 15/07/21.
//

import Foundation
import UIKit

    
class Navigation
{
    
    //using "class func" keywords makes a static function.
    //Methods scope is internal by default so it is visible to all other classes in the
    //project
    
    class func getNavigationUrl(stringUrl : String) -> Any {
        if stringUrl.contains("google") {
            print("exists")
        }
        
        let data = Data(stringUrl.utf8)
        print(data)
       // let data = string.data(using: .utf8)
       // UIApplication.shared.open(URL(string: stringUrl )!, options: [:], completionHandler: nil)
        
        if let urlString = stringUrl as? String {
            if NSURL(string: urlString) != nil {
               // UIApplication.shared.open(URL(string: stringUrl )!, options: [:], completionHandler: nil)
            }
        }
        return stringUrl
   }
    
}

extension UIViewController {
    
     func alert(message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}


