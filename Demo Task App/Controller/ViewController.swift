//
//  ViewController.swift
//  Demo Task App
//
//  Created by apple on 04/07/21.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController{
    @IBOutlet weak var tbl: UITableView!
    var responseArr = Array<Any>()
    var cat1Dictionary = [String: Any]()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadDataMethod()
        registerTableViewCell()
        getServerData()
    }
    // Get Response from Server
    func getServerData() -> Void {
        AF.request(APIUrl.getUrl, method: .get, parameters: nil)
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
            }
        }
    }
}

