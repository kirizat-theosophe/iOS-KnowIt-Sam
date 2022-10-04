//
//  DetailsView.swift
//  KnowItSam-1
//
//  Created by Bruker on 17/02/2022.
//

import SwiftUI

struct DetailsView: View {
    
    let userItem: User
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text(userItem.name)
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                Text("username: \(userItem.username)")
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                Text("Email: \(userItem.email)")
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                Text("City: \(userItem.address.city)")
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                
            }
            Spacer()
            
        }
        .padding()
        .navigationBarTitle(Text(userItem.name), displayMode: .automatic)
    }
}
