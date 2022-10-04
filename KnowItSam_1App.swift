//
//  KnowItSam_1App.swift
//  KnowItSam-1
//
//  Created by Bruker on 17/02/2022.
//

import SwiftUI

@main
struct KnowItSam_1App: App {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
    }
    var body: some Scene {
        WindowGroup {
            IntroductionView()
        }
    }
}
