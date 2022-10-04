//
//  Omsorgsbolig.swift
//  KnowItSam-1
//
//  Created by Bruker on 22/02/2022.
//

import SwiftUI

struct Omsorgsbolig: View {
    
    @State var users: [User] = []
    @State var searchText = ""
    
    @State var title1: String = "Mottar du tjenester fra den kommunale eldreomsorgen, skal du så langt det er mulig få et verdig tjenestetilbud som er tilpasset dine individuelle behov. Du har ret til selbestemmelse og skal møte respekt for den du er og for din livsførsel,"
    @State var title2: String = "Verdighetsgarantien skal sikre at du som mottar omsogrsthenester får en verdig, trygg og menningsfull aldredom. Det skal tas hensyn til"
    @State var title3: String = ". at du har en bofo som er-riktig ut fra dit behov og din tilstand"
    
    var body: some View {
        //NavigationView{
        
            TabView {
                VStack(spacing: 20){
                    Text("Omsorgsbolig")
                        .bold()
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .offset(y: 5)
                        .offset(x: -20)
                        .padding(20)
                    
                    Text(title1)
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                    Text(title2)
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                  
                }
                /*.navigationBarItems(
                    
                   leading:
                        HStack {
                            Image("heart.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                            Image("heart.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                    ,
                    trailing:
                        Image("heart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                    
                        .accentColor(.red)
                  
                    )*/
                
                
                        .tabItem {
                            Label("KATALOG", systemImage: "list.bullet")
                        }
                    
                    
                        //.navigationBarTitle("Omsorgsbolig og Sykehjem")
                    
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
