//
//  ApiCall.swift
//  KnowItSam-1
//
//  Created by Bruker on 17/02/2022.
//

import SwiftUI

class apiCall {
    func getUsers(completion:@escaping ([User]) -> ()){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let users = try! JSONDecoder().decode([User].self, from: data!)
            //print(users)
            
            DispatchQueue.main.async {
                completion(users)
            }
        }
        .resume()
    }
}
