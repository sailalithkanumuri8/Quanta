//
//  LoginView.swift
//  Vista
//
//  Created by SaiLalith Kanumuri on 12/18/23.
//

import SwiftUI

// This displayed the login page
struct LoginView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
        // Displays the background of the Login page
        ZStack {
            Color("Color")
                .opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 500, height: 870)
                .edgesIgnoringSafeArea(.all)
                .offset(y: -12)
            
            VStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 450, height: 450)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .offset(y: -20)

                Text("Vista")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .font(Font.custom("Quicksand-Bold", size: 50))
                    .multilineTextAlignment(.center)
                    .offset(y: -200)
                
                Text("Your Journey, Your Story")
                    .fontWeight(.light)
                    .font(Font.custom("Quicksand-Regular", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .offset(y: -200)
                
                // This is the Google sign in button on the page
                // It uses the viewModel to authenticate sign in
                Button {
                    viewModel.signIn()
                } label: {
                    HStack {
                        Spacer()
                        
                        Image("Google Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28, height: 28)
                        
                        Spacer()
                        
                        Text("SIGN IN WITH GOOGLE")
                            .fontWeight(.medium)
                            .kerning(1.1)
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width: 350)
                    .background(.white)
                    .cornerRadius(50)
                }
                .offset(y: -190)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
