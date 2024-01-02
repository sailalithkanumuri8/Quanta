//
//  GoogleSignInButton.swift
//  GoogleSignInPage
//
//  Created by SaiLalith Kanumuri on 7/1/22.
//

import SwiftUI
import GoogleSignIn

// This is the google sign in button
// Has the functionality
// Wrapped by UIViewRepresentable
struct GoogleSignInButton: UIViewRepresentable {
    @Environment(\.colorScheme) var colorScheme
    
    private var button = GIDSignInButton()
    
    // Makes the view
    func makeUIView(context: Context) -> GIDSignInButton {
        button.colorScheme = colorScheme == .dark ? .dark : .light
        return button
    }
    
    // Updates the view
    func updateUIView(_ uiView: UIViewType, context: Context) {
        button.colorScheme = colorScheme == .dark ? .dark : .light
    }
}
