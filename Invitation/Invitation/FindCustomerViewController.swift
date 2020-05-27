//
//  ViewController.swift
//  Invitation
//
//  Created by Cris Burlamaqui on 27/05/2020.
//  Copyright © 2020 Cris Burlamaqui. All rights reserved.
//

import UIKit
import CoreLocation

class FindCustomerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var customerTableView: UITableView!
    
    var customerList:[Customer] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ingestCustomerJSON()
    }
    
    //MARK: Ingest customer json
    
    private func ingestCustomerJSON() {
        
        do {
            let sortedList = try Array<Customer>.init(fileName: "customers").sorted{ $0.user_id < $1.user_id }
            sortCustomers(sortedList)
        } catch  {
            print(error)
        }
        
    }
    
    // MARK: Sort customer list for distance
    
    func sortCustomers(_ list: [Customer]) {

        let officeCoordinate = CLLocation.init(latitude: 53.339428, longitude: -6.257664)
        
        for customer in list {
            
            let lati = customer.latitude.doubleValue
            let long = customer.longitude.doubleValue
            
            let customerCoordinate = CLLocation.init(latitude: lati, longitude: long)
            let distanceInKm = officeCoordinate.distance(from: customerCoordinate) / 1000
            
            if distanceInKm <= 100 {
                customerList.append(customer)
            }
        }
    }
    
    // MARK: Show list of customer
    
    @IBAction func showCustomerListAction(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1) {
            
            self.customerTableView.isHidden = false
            self.customerTableView.alpha = 1
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

extension String {
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
}

