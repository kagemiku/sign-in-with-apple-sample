//
//  LoginView.swift
//  sign-in-with-apple-sample
//
//  Created by kagemiku on 2019/06/23.
//  Copyright © 2019 kagemiku. All rights reserved.
//

import SwiftUI

struct LoginView : View {

    @EnvironmentObject private var userState: UserState

    var body: some View {
        VStack {
            Text("Please login")
                .font(.title)

            AppleIDButtonViewController(userState: userState)
                .padding()
        }
    }

}

#if DEBUG
struct LoginView_Previews : PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif
