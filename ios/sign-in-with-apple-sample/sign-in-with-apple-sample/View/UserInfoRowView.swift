//
//  UserInfoRowView.swift
//  sign-in-with-apple-sample
//
//  Created by kagemiku on 2019/06/23.
//  Copyright © 2019 kagemiku. All rights reserved.
//

import SwiftUI

struct UserInfoRowView : View {

    @EnvironmentObject private var userState: UserState
    let path: KeyPath<User, String>

    var body: some View {
        HStack {
            Text(path.stringValue)
                .bold()

            Spacer()

            Text(userState.user?[keyPath: path] ?? "")
        }
        .padding()
    }

}

#if DEBUG
struct UserInfoRowView_Previews : PreviewProvider {
    static var previews: some View {
        UserInfoRowView(path: \.name)
            .previewLayout(.fixed(width: 300, height: 50))
    }
}
#endif
