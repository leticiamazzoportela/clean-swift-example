//
//  HomeScenePresenter.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 10/01/23.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    func buildCatImage(with data: CatResponseModel)
    func buildDogImage(with data: DogResponseModel)
}

final class HomePresenter: HomePresenterProtocol {
    private var view: HomeViewDisplayProtocol?

    init(view: HomeViewDisplayProtocol?) {
        self.view = view
    }

    func buildCatImage(with data: CatResponseModel) {
        let url = data.url ?? "placeholder"
        let imagePath = "\(EndPoints.catHost.rawValue)\(url)"
        self.buildImage(with: imagePath)
    }

    func buildDogImage(with data: DogResponseModel) {
        self.buildImage(with: data.url ?? "placeholder")
    }

    private func buildImage(with imagePath: String) {
        let url = URL(string: imagePath)
        let viewModel = HomeViewModel()
        viewModel.imageURL = url

        DispatchQueue.main.async {
            self.view?.updateImage(viewModel: viewModel)
        }
    }
}
