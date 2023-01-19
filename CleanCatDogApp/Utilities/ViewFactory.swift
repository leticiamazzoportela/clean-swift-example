//
//  HomeSceneConfigurator.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 16/01/23.
//

import SwiftUI

protocol ViewFactoryProtocol: AnyObject {
    associatedtype ViewType: View
    func createView() -> ViewType
}

enum ViewType {
    case home
}

final class ViewFactory: ViewFactoryProtocol {
    private let viewType: ViewType

    init(viewType: ViewType) {
        self.viewType = viewType
    }

    func createView() -> some View {
        switch self.viewType {
        case .home: return self.createHomeView()
        }
    }

    private func createHomeView() -> HomeView {
        let catWorker = CatWorker(catService: NetworkService())
        let dogWorker = DogWorker(dogService: NetworkService())

        var view = HomeView()
        let presenter = HomePresenter(view: view)
        let interactor = HomeInteractor(presenter: presenter, catWorker: catWorker, dogWorker: dogWorker)

        view.interactor = interactor

        return view
    }
}
