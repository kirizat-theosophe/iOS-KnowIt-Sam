//
//  IntroductionView.swift
//  KnowItSam-1
//
//  Created by Bruker on 28/02/2022.
//

import SwiftUI

struct IntroductionView: View {
    /* let names = ["Leanne Graham","Ervin Howell","Clementine Bauch","Patricia Lebsack","Chelsey Dietrich","Mrs. Dennis Schulist","Kurtis Weissnat","Nicholas Runolfsdottir V","Glenna Reichert","Clementina DuBuque",""]*/
     
     @State var users: [User] = []//MainCateGoryData
     @State var searchText = ""
         //.searchable(text: $searchText)
     
     var body: some View {
         NavigationView {
             
             TabView {
                 let filteredUsers = searchText == "" ? users: users.filter { $0.name.contains(searchText) }
                 List (filteredUsers) { user in
                     NavigationLink (destination: Underkategorier()) {
                     HStack {
                         Text(user.name)
                             .foregroundColor(.blue)
                             .padding()
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
             
                 
                 .navigationBarTitle("Nasjonal tjenestekatalog")
                 
                 .onAppear {
                     apiCall().getUsers { (users) in
                         self.users = users
                     }
                 }
             
                 
                 
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
         
     
     
    /* var results: [String] {
         if searchText.isEmpty {
             return names
         } else {
             return names.filter { $0.contains(searchText)}
         }
     }
     
    
 }*/

//}

//struct IntroductionView_Previews: PreviewProvider {
  //  static var previews: some View {
    //    IntroductionView()
    //}
//}
