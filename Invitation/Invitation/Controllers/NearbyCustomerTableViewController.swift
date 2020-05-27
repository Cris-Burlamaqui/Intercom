//
//  NearbyCustomerTableViewController.swift
//  Invitation
//
//  Created by Cris Burlamaqui on 27/05/2020.
//  Copyright © 2020 Cris Burlamaqui. All rights reserved.
//

import UIKit
import CoreLocation


class NearbyCustomerTableViewController: UITableViewController {
    
    var customerList:[Customer] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        ingestCustomerJSON()
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: Ingest customer json
    
    private func ingestCustomerJSON() {
        
        do {
            let sortedList = try Array<Customer>.init(fileName: "customers").sorted{ $0.user_id < $1.user_id }
            customerList = sortCustomers(sortedList)
        } catch  {
            print(error)
        }
        
    }
    
    // MARK: Sort customer list for distance
    
    func sortCustomers(_ list: [Customer]) -> [Customer] {

        let officeCoordinate = CLLocation.init(latitude: 53.339428, longitude: -6.257664)
        var customers = Array<Customer>()
        
        for customer in list {
            
            let lati = customer.latitude.doubleValue
            let long = customer.longitude.doubleValue
            
            let customerCoordinate = CLLocation.init(latitude: lati, longitude: long)
            let distanceInKm = officeCoordinate.distance(from: customerCoordinate) / 1000
            
            if distanceInKm <= 100 {
                customers.append(customer)
            }
        }
        return customers
    }
    

    // MARK: - Table view

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return customerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "customerCell")
        
        cell.textLabel?.text = String(customerList[indexPath.row].user_id)
        cell.detailTextLabel?.text = customerList[indexPath.row].name
        
        return cell
    }
}

extension String {
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
}
