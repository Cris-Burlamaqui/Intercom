//
//  Customer.swift
//  Invitation
//
//  Created by Cris Burlamaqui on 27/05/2020.
//  Copyright © 2020 Cris Burlamaqui. All rights reserved.
//

import Foundation

struct Customer: Decodable, Equatable {
    
    enum DecodingError: Error {
        case missingFile
    }
    
    let user_id: Int
    let name: String
    let latitude: String
    let longitude: String
}

extension Array where Element == Customer {
    
    init(fileName: String) throws {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json")
            else { throw Customer.DecodingError.missingFile }
        
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        self = try decoder.decode([Customer].self, from: data)
    }
}
