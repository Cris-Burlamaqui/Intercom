//
//  ViewController.swift
//  Invitation
//
//  Created by Cris Burlamaqui on 27/05/2020.
//  Copyright © 2020 Cris Burlamaqui. All rights reserved.
//

import UIKit

class FindCustomerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var customerTableView: UITableView!
    
    var customerList:[Customer] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ingestCustomerJSON()
    }
    
    //MARK: Ingested customer json
    
    private func ingestCustomerJSON() {
        
        do {
            customerList = try Array<Customer>.init(fileName: "customers")
            customerList = customerList.sorted { $0.user_id < $1.user_id }
        } catch  {
            print(error)
        }
        
    }
    
    // MARK: Find near customer
    
    @IBAction func findCustomerAction(_ sender: UIButton) {
        
        customerTableView.isHidden = false
        customerTableView.alpha = 0.0
        
        UIView.animate(withDuration: 1) {
            self.customerTableView.alpha = 1
            self.customerTableView.reloadData()
        }
    }
    
    // MARK: TableView methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell") as! CustomerCell
        
        cell.customerID.text = String(customerList[indexPath.row].user_id)
        cell.customerName.text = customerList[indexPath.row].name
        
        return cell
    }
}

