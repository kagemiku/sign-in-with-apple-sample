//
//  UserInfoView.swift
//  sign-in-with-apple-sample
//
//  Created by kagemiku on 2019/06/23.
//  Copyright © 2019 kagemiku. All rights reserved.
//

import SwiftUI

struct UserInfoView : View {

    @EnvironmentObject private var userState: UserState

    var body: some View {
        NavigationView {
            List {
                if userState.isLoggedIn {
                    UserInfoRowView(path: \.id)
                    UserInfoRowView(path: \.name)
                    UserInfoRowView(path: \.email)

                    Button(action: {
                        self.userState.user = nil
                    }) {
                        Text("Logout")
                            .bold()
                            .font(.headline)
                    }
                    .padding()
                } else {
                    NavigationButton(destination: LoginView()) {
                        Text("Login")
                            .bold()
                            .font(.headline)
                    }
                    .padding()
                }
            }
            .navigationBarTitle(Text("User Information"))
        }
    }

}

#if DEBUG
struct UserInfoView_Previews : PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
#endif
