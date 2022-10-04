//
//  Saker.swift
//  KnowItSam-1
//
//  Created by Bruker on 22/02/2022.
//

import SwiftUI

struct Saker: View {
    
    @State var users: [User] = []
    @State var searchText = ""
    
   var body: some View {

           TabView{
               VStack (spacing: 30){
                 
                   NavigationLink( destination: Avlastning(), label: {
                       Text("Avlastning")
                           .bold()
                           .frame(width: 400, height: 75)
                           .background(Color.blue)
                           .foregroundColor(.white)
                           .cornerRadius(15)
                   })
                   
                   NavigationLink( destination: Omsorgsbolig(), label: {
                       Text("Omsorgsbolig")
                           .bold()
                           .frame(width: 400, height: 75)
                           .background(Color.blue)
                           .foregroundColor(.white)
                           .cornerRadius(15)
                   })
                   NavigationLink( destination: Krisesenter(), label: {
                       Text("Krisesenter")
                           .bold()
                           .frame(width: 400, height: 75)
                           .background(Color.blue)
                           .foregroundColor(.white)
                           .cornerRadius(15)
                   })
                   NavigationLink( destination: Eldreomsorg(), label: {
                       Text("Eldreomsorg")
                           .bold()
                           .frame(width: 400, height: 75)
                           .background(Color.blue)
                           .foregroundColor(.white)
                           .cornerRadius(15)
                   })
                   Spacer()
                       .tabItem {
                           Label("KATALOG", systemImage: "list.bullet")
                       }
                   
                       
                       .navigationBarTitle("Omsorgsbolig og Sykehjem")
                       
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
             
               

               
           
           
          /* var results: [String] {
               if searchText.isEmpty {
                   return names
               } else {
                   return names.filter { $0.contains(searchText)}
               }
           }
           
          
       }*/

}
