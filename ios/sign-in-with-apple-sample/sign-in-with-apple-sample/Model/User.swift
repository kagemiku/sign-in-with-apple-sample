//
//  User.swift
//  sign-in-with-apple-sample
//
//  Created by kagemiku on 2019/06/23.
//  Copyright © 2019 kagemiku. All rights reserved.
//

import Foundation

struct User {

    let id: String
    let name: String
    let email: String

    static let `default` = Self(id: "id", name: "name", email: "email")

}

extension PartialKeyPath where Root == User {

    var stringValue: String {
        switch self {
        case \User.id: return "id"
        case \User.name: return "name"
        case \User.email: return "email"
        default: fatalError("Unexpected key path")
        }
    }

}
