//
//  Parser.swift
//  KnowItSam-1
//
//  Created by Bruker on 17/02/2022.
//

import SwiftUI

struct Parser {
    
    func parse() {
        let api = URL(string: "")
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do {
            let result = try JSONDecoder().decode(Contact.self, from: data!)
            
                print(result)
                
            } catch {
                
            }
        }.resume()
    }
}

