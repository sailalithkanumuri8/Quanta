//
//  MyNCHS.swift
//  Quanta
//
//  Updated by SaiLalith Kanumuri on 12/18/23.
//

// Import Swift and Firebase for use
import SwiftUI
import Firebase

@main
struct MyNCHSApp: App {
    @StateObject var viewModel = AuthenticationViewModel()

    // Sets up authentication for google sign in
    init() {
        setupAuthentication()
    }
    
    // Runs the ContentView() file by giving it the authentication
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

// Uses Firebase to check authenticaion
extension MyNCHSApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
  }
}
