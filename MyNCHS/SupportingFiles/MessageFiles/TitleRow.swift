//
//  TitleRow.swift
//  Quanta
//
//  Created by Manvith Kothapalli on 12-22-23.
//

import SwiftUI

// This is the code for the title part of the messages
// It includes the user name and email
struct TitleRow: View {
    let name: String
    let email: String
    
    var body: some View {
        HStack(spacing: 20) {
            ZStack(alignment: .leading) {
                Color.white
                    .cornerRadius(30)

                VStack(alignment: .leading) {
                    Text(name)
                        .font(Font.custom("Quicksand-Bold", size: 30))
                        .foregroundColor(.black)
                        .padding(.leading, 8)

                    Text(email)
                        .font(Font.custom("Quicksand-Medium", size: 15))
                        .foregroundColor(.black)
                        .padding(.leading, 8)
                }
                .padding()
            }
            .frame(width: 370, height: 100, alignment: .leading)
        }
        .padding()
    }
}
