//
//  ContentView.swift
//  Quanta
//
//  Updated by SaiLalith Kanumuri on 12/18/23.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var viewModel: AuthenticationViewModel
  
    // Checks if authentication is correct or inorrect
    var body: some View {
      switch viewModel.state {
        // If correct, it will launch the menu, which then displays all of the pages
        case .signedIn: Menu()
        // If incorrect, it will stay in the Login page
        case .signedOut: LoginView()
    }
  }
}

// Generates preview for this file
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
