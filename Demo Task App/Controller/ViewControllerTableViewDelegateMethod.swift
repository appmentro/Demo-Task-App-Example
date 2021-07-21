//
//  GetInTouchTableViewDelegateMethod.swift
//  FMCCorporate
//
//  Created by Tejas Pareek on 13/10/20.
//  Copyright © 2020 Venkata Sai Kumar. All rights reserved.
//

import Foundation
import UIKit
extension ViewController: UITableViewDelegate, UITableViewDataSource, PopUpMethods {
    //MARK-: UITableView Delegate and Datasourse Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.responseArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dict = self.responseArr[indexPath.row] as! Dictionary<String,Any>
        let category = dict["category"] as? Int ?? 0
        if category == 1 {
          let cell = tableView.dequeueReusableCell(withIdentifier: "Category1TableViewCell", for: indexPath) as! Category1TableViewCell
            cell.classDelegat = self

          cell.responseArr = responseArr
          cell.setCategory1Data(dict: dict)
          cell.selectionStyle = .none
          cell.layoutIfNeeded()
          return cell
        }
        else if category == 2 {
           let cell = tableView.dequeueReusableCell(withIdentifier: "Category2TableViewCell", for: indexPath) as! Category2TableViewCell
           
           cell.responseArr = responseArr
            cell.setData(dict: dict)
           cell.selectionStyle = .none
           return cell
       }
       else if category == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Category3TableViewCell", for: indexPath) as! Category3TableViewCell
            cell.selectionStyle = .none
            return cell
        }
        else if category == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Category4TableViewCell", for: indexPath) as! Category4TableViewCell
            cell.setData(dict: dict)
            return cell
        }
        else {
           let cell = tableView.dequeueReusableCell(withIdentifier: "Category5TableViewCell", for: indexPath) as! Category5TableViewCell
           cell.selectionStyle = .none
            return cell
        }
    }
    
    //MARK-: Protocol Method
    func showPopUpView(imageUrl: String) {
       // self.alert(message: imageUrl, title: "Hello")

        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PopUPViewController") as! PopUPViewController
        nextViewController.imageStr = imageUrl
        //self.navigationController?.pushViewController(nextViewController, animated: true)
        self.present(nextViewController, animated:true, completion:nil)
        
    }

   
}

