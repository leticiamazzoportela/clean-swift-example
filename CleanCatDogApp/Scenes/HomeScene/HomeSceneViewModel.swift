//
//  HomeSceneViewModel.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 17/01/23.
//

import SwiftUI

final class HomeSceneViewModel: ObservableObject {
    @Published var imageURL: URL?
    @Published var isLoading: Bool = false

    func handleLoading(status: Bool) {
        self.isLoading = status
    }
}
