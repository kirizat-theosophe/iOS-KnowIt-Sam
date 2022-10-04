//
//  Underkategorier.swift
//  KnowItSam-1
//
//  Created by Bruker on 22/02/2022.
//

import SwiftUI

struct Underkategorier: View {
    
    @State var users: [User] = []
    @State var searchText = ""
    //.searchable(text: $searchText)
    
    var body: some View {
        NavigationView {
            
            /* List {
             ForEach(results, id: \.self) { name in
             NavigationLink(destination: Text(name)) {
             Text(name)
             }
             }
             
             Text(user.username)
                 .foregroundColor(.blue)
             Text(user.website)
                 .foregroundColor(.black)
             
             */
            
            TabView {
                let filteredUsers = searchText == "" ? users: users.filter { $0.name.contains(searchText) }
                List (filteredUsers) { user in
                    NavigationLink (destination: Saker()) {
                    HStack {
                        Text(user.username)
                            .foregroundColor(.blue)
                        Text(user.website)
                            .foregroundColor(.black)
                        /*FontIcon.text(.materialIcon(code: assistant), fontsize: 45, color: blue)*/
                            .font(.headline)
                    }//.padding(7)
                    .listRowBackground(Color.clear)
                    .cornerRadius(10)
                    
                        
                  }
                }
                
                .tabItem {
                    Label("KATALOG", systemImage: "list.bullet")
                }
                
                
                .navigationBarTitle("Helse og omsorg")
                
                .onAppear {
                    apiCall().getUsers { (users) in
                        self.users = users
                    }
                }
                /*NavigationLink(destination: Saker(), label: {
                 Text("Go to Your Topics")
                 .bold()
                 .frame(width: 280, height: 50)
                 .background(Color.green)
                 .foregroundColor(.white)
                 .cornerRadius(15)
                 
                 })*/
                
                
                
                VStack {
                    
                }
                
                //.navigationBarTitle("Favorites")
                .tabItem {
                    Label("FAVORITER", systemImage: "heart.fill")
                }
                VStack {
                    
                }
                //.navigationBarTitle("Favorites")
                .tabItem {
                    Label("INSTILLINGER", systemImage: "star.fill")
                }
            }
        }
        
        .searchable(text: $searchText)
    }
    
}

