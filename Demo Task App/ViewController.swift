//
//  ViewController.swift
//  Demo Task App
//
//  Created by apple on 04/07/21.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tbl: UITableView!
    var responseArr = Array<Any>()
    var cat1Dictionary = [String: Any]()
    let refreshControl = UIRefreshControl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl.attributedTitle = NSAttributedString(string: "Reload")
          refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        self.tbl.addSubview(refreshControl)
        
        
        tbl.register(UINib(nibName: "Category1TableViewCell", bundle: nil), forCellReuseIdentifier: "Category1TableViewCell")
        
        tbl.register(UINib(nibName: "Category2TableViewCell", bundle: nil), forCellReuseIdentifier: "Category2TableViewCell")
        
        tbl.register(UINib(nibName: "Category3TableViewCell", bundle: nil), forCellReuseIdentifier: "Category3TableViewCell")
        
        tbl.register(UINib(nibName: "Category4TableViewCell", bundle: nil), forCellReuseIdentifier: "Category4TableViewCell")
        
        tbl.register(UINib(nibName: "Category5TableViewCell", bundle: nil), forCellReuseIdentifier: "Category5TableViewCell")
        getServerData()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        getServerData()
        refreshControl.endRefreshing()
    }
    
    
    // Get Response from Server

    func getServerData() -> Void {
        AF.request("https://api.jsonbin.io/b/60df9dbd9328b059d7b54d39/1", method: .get, parameters: nil)
            .responseJSON { (response) in
                switch response.result {
                case .success:
                if let JSON = response.value as? Array<Any> {
                    self.responseArr = JSON
                    print(self.responseArr)
                    self.tbl.delegate = self
                    self.tbl.dataSource = self
                    self.tbl.reloadData()
                        
                }
                case .failure(let error): break
                   // error handling
            }
        }
    }
    
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
            if let title1 = dict["hcard_title_01"] {
                cell.txt1.text = (title1 as? String ?? "")
            }
            if let title2 = dict["hcard_title_02"] {
                cell.txt2.text = (title2 as? String ?? "")
            }
            if let title3 = dict["hcard_title_03"] {
                cell.txt3.text = (title3 as? String ?? "") 
            }
            
            if let image1 = dict["hcard_bgimg_01"] {
                cell.image1.sd_setImage(with: URL(string: image1 as! String), placeholderImage: nil)
            }
            
            if let image2 = dict["hcard_bgimg_02"] {
                cell.image2.sd_setImage(with: URL(string: image2 as! String), placeholderImage: nil)
            }
            
            if let image3 = dict["hcard_bgimg_03"] {
                cell.image3.sd_setImage(with: URL(string: image3 as! String), placeholderImage: nil)
            }
            cell.button1.addTarget(self, action: #selector(Btn1Tapped(_:)), for: .touchUpInside)
            cell.button2.addTarget(self, action: #selector(Btn2Tapped(_:)), for: .touchUpInside)
            cell.button3.addTarget(self, action: #selector(Btn3Tapped(_:)), for: .touchUpInside)
            cell.selectionStyle = .none
            cell.layoutIfNeeded()
            return cell
        }
        else if category == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Category2TableViewCell", for: indexPath) as! Category2TableViewCell
           if let title1 = dict["title"] {
               cell.impLinkLbl.text = (title1 as! String)
           }
           cell.viewAllButton.addTarget(self, action: #selector(viewAllButtonTapped(_:)), for: .touchUpInside)
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
            cell.lblTag.text = dict["tag"] as? String ?? ""
            cell.lblTitle.text = dict["title"] as? String ?? ""
            cell.lblsubTitle.text = dict["subtitle"] as? String ?? ""
            cell.lblTime.text = dict["hcard_tag_01"] as? String ?? ""
            cell.lblPhase.text = dict["hcard_tag_02"] as? String ?? ""
            cell.selectionStyle = .none
            return cell
        }
        else {
           let cell = tableView.dequeueReusableCell(withIdentifier: "Category5TableViewCell", for: indexPath) as! Category5TableViewCell
           cell.selectionStyle = .none
            return cell
        }
    }
    
    // Selector Methods of Category 1
    @objc func Btn1Tapped(_ sender: UIButton) {
        print("Btn1 tapped")
        let dict = self.responseArr[0] as! Dictionary<String,Any>

        
        if let navigate1 = dict["hcard_navigate_01"] {
            UIApplication.shared.open(URL(string: navigate1 as! String)!, options: [:], completionHandler: nil)
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
    
    // Selector Methods of Category 2
    @objc func viewAllButtonTapped(_ sender: UIButton) {
        
        let dict = self.responseArr[1] as! Dictionary<String,Any>

        if let navigate1 = dict["navigate"] {
            UIApplication.shared.open(URL(string: navigate1 as! String)!, options: [:], completionHandler: nil)
        }
    }
    
    
    
    
}

