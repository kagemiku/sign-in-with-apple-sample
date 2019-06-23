//
//  AppleIDButtonViewController.swift
//  sign-in-with-apple-sample
//
//  Created by kagemiku on 2019/06/23.
//  Copyright © 2019 kagemiku. All rights reserved.
//

import SwiftUI
import UIKit
import AuthenticationServices

struct AppleIDButtonViewController: UIViewControllerRepresentable {

    @ObjectBinding var userState: UserState

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let authorizationButton = ASAuthorizationAppleIDButton()
        authorizationButton.addTarget(context.coordinator, action: #selector(Coordinator.handleAuthorizationAppleIDButtonPress), for: .touchUpInside)

        let vc = UIViewController()
        vc.view.addSubview(authorizationButton)

        let height: CGFloat = 50
        let padding: CGFloat = 10
        authorizationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                authorizationButton.heightAnchor.constraint(equalToConstant: height),
                authorizationButton.topAnchor.constraint(equalTo: vc.view.topAnchor, constant: padding),
                authorizationButton.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor, constant: padding),
                authorizationButton.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor, constant: -padding),
            ]
        )

        return vc
    }

    func updateUIViewController(_ viewController: UIViewController, context: Context) {
        // nothing to do
    }

    class Coordinator: NSObject, ASAuthorizationControllerDelegate/*, ASAuthorizationControllerPresentationContextProviding */{

        var parent: AppleIDButtonViewController

        init(_ viewController: AppleIDButtonViewController) {
            self.parent = viewController
        }

        @objc
        func handleAuthorizationAppleIDButtonPress() {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]

            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            //authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
        }

        func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
            if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                let user = appleIDCredential.user
                let fullName = appleIDCredential.fullName
                let email = appleIDCredential.email

                let name = "\(fullName?.givenName ?? "") \(fullName?.familyName ?? "")"
                parent.userState.user = User(id: user, name: name, email: email ?? "")
            }
        }

        func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
            print("Error: \(error)")
        }

        // ???: This may not be needed.
//        func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//            let window = UIApplication.shared.keyWindow!
//            return window
//        }

    }

}


