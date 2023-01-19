//
//  CleanCatDogApp.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 10/01/23.
//

import SwiftUI

@main
struct CleanCatDogAppApp: App {
    var body: some Scene {
        WindowGroup {
            ViewFactory(viewType: .home).createView()
        }
    }
}
