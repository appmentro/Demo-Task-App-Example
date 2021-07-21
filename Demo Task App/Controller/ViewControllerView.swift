//
//  GetInTouchTableViewDelegateMethod.swift
//  FMCCorporate
//
//  Created by Tejas Pareek on 13/10/20.
//  Copyright © 2020 Venkata Sai Kumar. All rights reserved.
//

import Foundation
import UIKit

 extension ViewController {
    /*************************Pull to refresh *******************************/
    func reloadDataMethod() -> Void {
        refreshControl.attributedTitle = NSAttributedString(string: "Reload")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        self.tbl.addSubview(refreshControl)
    }
    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        getServerData()
        refreshControl.endRefreshing()
    }
    /*************************Table Cell Register *******************************/
    func registerTableViewCell() -> Void {
        tbl.register(UINib(nibName: "Category1TableViewCell", bundle: nil), forCellReuseIdentifier: "Category1TableViewCell")
        tbl.register(UINib(nibName: "Category2TableViewCell", bundle: nil), forCellReuseIdentifier: "Category2TableViewCell")
        tbl.register(UINib(nibName: "Category3TableViewCell", bundle: nil), forCellReuseIdentifier: "Category3TableViewCell")
        tbl.register(UINib(nibName: "Category4TableViewCell", bundle: nil), forCellReuseIdentifier: "Category4TableViewCell")
        tbl.register(UINib(nibName: "Category5TableViewCell", bundle: nil), forCellReuseIdentifier: "Category5TableViewCell")
    }
}
