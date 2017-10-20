//
//  Person.swift
//  Codable
//
//  Created by abbott on 2017/9/19.
//  Copyright © 2017年 NIP. All rights reserved.
//

import UIKit

struct Person: Codable {
    let name: String
    let age: Int?

    enum CodingKeys: String, CodingKeys {
        case name = "title"
        case age = "age"
    }
}

struct Book: Codable {
    let price: Double
    let authors: [Person]
}
