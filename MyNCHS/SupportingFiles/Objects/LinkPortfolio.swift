//
//  LinkPortfolio.swift
//  Quanta
//
//  Created by SaiLalith Kanumuri on 12/29/23.
//

import SwiftUI

// Used to make the portfolio activity buttons buttons
// This is an class that can be instanciated to an object that takes paramters
// Exists to use less lines of repetitive code to perform the same task
import SwiftUI

struct LinkPortfolio: View {
    var image: String
    var text1: String
    var text2: String

    var body: some View {
        VStack {
            HStack {
                Image(systemName: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .foregroundColor(.blue) // Add color here

                Spacer()

                VStack {
                    Text(LocalizedStringKey(text1))
                        .font(Font.custom("Quicksand-Bold", size: 15))
                        .foregroundColor(.black)
                        .frame(width: 140, alignment: .leading)
                        .offset(x: 5)

                    Text(LocalizedStringKey(text2))
                        .font(Font.custom("Quicksand-Medium", size: 10))
                        .foregroundColor(.black)
                        .frame(width: 140, alignment: .leading)
                        .offset(x: 5)
                }
                .frame(width: 120, height: 80)
            }
            .frame(width: 200, height: 75)
            .padding()
            .background(.white)
            .cornerRadius(15)
        }
    }
}
