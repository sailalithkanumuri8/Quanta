//
//  LinkNews.swift
//  MyNCHS
//
//  Created by SaiLalith Kanumuri on 12/30/22.
//

import SwiftUI

// Used to make the news buttons
// This is an class that can be instanciated to an object that takes paramters
// Exists to use less lines of repetitive code to perform the same task
struct LinkNews: View {
    @State var showWebView = false
    
    var url: URL
    var image: String
    var text1: String
    var text2: String
    var text3: String
    
    var body: some View {
        Button {
            showWebView.toggle()
        } label: {
            // Button label
            VStack {
                Text("News")
                    .font(Font.custom("Quicksand-Bold", size: 12))
                    .foregroundColor(.white)
                    .frame(width: 55, height: 25)
                    .background(Color("Color"))
                    .cornerRadius(40)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(100)
                    .padding(.bottom, 15)
                
                VStack {
                    Text(LocalizedStringKey(text1))
                        .font(Font.custom("Quicksand-Bold", size: 25))
                        .foregroundColor(.black)
                        .frame(width: 250, alignment: .leading)
                        .padding(.leading, 10) // Add right padding
                        .padding(.bottom, 2)
                    
                    Text(LocalizedStringKey(text2))
                        .font(Font.custom("Quicksand-Medium", size: 15))
                        .foregroundColor(.black)
                        .frame(width: 250, alignment: .leading)
                        .lineSpacing(3)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 10) // Add right padding
                        .padding(.bottom, 30)
                        
                    
                    Text(LocalizedStringKey(text3))
                        .font(Font.custom("Quicksand-Regular", size: 10))
                        .foregroundColor(.black)
                        .frame(width: 250, alignment: .leading)
                        .padding(.leading, 5) // Add right padding
                }
            }
            .frame(width: 250, height: 300)
            .padding()
            .background(.white)
            .cornerRadius(15)
        }
        .sheet(isPresented: $showWebView) {
            WebView(url: url)
        }
    }
}
