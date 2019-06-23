//
//  UserState.swift
//  sign-in-with-apple-sample
//
//  Created by kagemiku on 2019/06/23.
//  Copyright © 2019 kagemiku. All rights reserved.
//

import SwiftUI
import Combine

final class UserState: BindableObject {

    let didChange = PassthroughSubject<UserState, Never>()

    var user: User? = nil {
        didSet {
            didChange.send(self)
        }
    }

    var isLoggedIn: Bool {
        user != nil
    }

}
