//
//  ViewController.swift
//  Invitation
//
//  Created by Cris Burlamaqui on 27/05/2020.
//  Copyright © 2020 Cris Burlamaqui. All rights reserved.
//

import UIKit

class FindCustomerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var customerTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func findCustomerAction(_ sender: UIButton) {
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell") as! CustomerCell
        
        return cell
    }
}

