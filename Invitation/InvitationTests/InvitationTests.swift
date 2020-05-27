//
//  InvitationTests.swift
//  InvitationTests
//
//  Created by Cris Burlamaqui on 27/05/2020.
//  Copyright © 2020 Cris Burlamaqui. All rights reserved.
//

import XCTest
@testable import Invitation

class InvitationTests: XCTestCase {
    
    var nearby: NearbyCustomerTableViewController!
    var customerList: [Customer]!
    
    let phoenixPark = Customer.init(user_id: 1, name: "Phoenix Park", latitude: "53.356805", longitude: "-6.329554")
    let madameTussauds = Customer.init(user_id: 2, name: "Madame Tussauds", latitude: "51.631016", longitude: "-0.141890")
    let guinnessStorehouse = Customer.init(user_id: 3, name: "Guinness Storehouse", latitude: "53.342367", longitude: "-6.286645")
    

    override func setUpWithError() throws {
        
        nearby = NearbyCustomerTableViewController()
        customerList = [phoenixPark, madameTussauds, guinnessStorehouse]
        
    }

    override func tearDownWithError() throws {
        
        customerList = []
    }
    
    func testNearDistance() throws {
        
        let correctList = [phoenixPark, guinnessStorehouse]
        let sortedList = nearby.sortCustomers(customerList)
        
        XCTAssertEqual(correctList, sortedList)
        
    }
    
    func testFarDistance() throws {
    
        let correctList = [madameTussauds]
        let sortedList = nearby.sortCustomers(customerList)
        
        XCTAssertNotEqual(correctList, sortedList)
        
    }

}
