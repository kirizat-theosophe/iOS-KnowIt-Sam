//
//  Tjeneste.swift
//  KnowItSam-1
//
//  Created by Bruker on 22/02/2022.
//

import SwiftUI

struct Tjeneste: View {
    
    @State var users: [User] = []
    @State var searchText = ""
        //.searchable(text: $searchText)
    
    var body: some View {
          /* List {
                ForEach(results, id: \.self) { name in
                    NavigationLink(destination: Text(name)) {
                        Text(name)
                    }
                }*/
            
            TabView {
                List (users) { user in
                    NavigationLink (destination: DetailsView(userItem: user)) {
                    HStack {
                        Text(user.name)
                        /*FontIcon.text(.materialIcon(code: assistant), fontsize: 45, color: blue)*/
                            .font(.headline)
                    }.padding(7)
                        
                  }
                }
            
                
                .tabItem {
                    Label("Catalogue", systemImage: "list.bullet")
                }
            
                
                .navigationBarTitle("Fetch JSON data")
                
                .onAppear {
                    apiCall().getUsers { (users) in
                        self.users = users
                    }
                }
            
                
                
                VStack {
                    
                }
                
                .navigationBarTitle("Favorites")
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
            }
        }
        //.searchable(text: $searchText)
       }
    
    
    
   /* var results: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText)}
        }
    }
    
   
}*/

