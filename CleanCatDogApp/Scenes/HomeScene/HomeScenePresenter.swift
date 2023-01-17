//
//  HomeScenePresenter.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 10/01/23.
//

import Foundation

protocol HomeScenePresenterProtocol: AnyObject {
    func buildCatImage(with data: CatResponseModel)
    func buildDogImage(with data: DogResponseModel)
}

final class HomeScenePresenter: HomeScenePresenterProtocol {
    private var view: HomeSceneViewDisplayProtocol?

    init(view: HomeSceneViewDisplayProtocol?) {
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
        let viewModel = HomeSceneViewModel()
        viewModel.imageURL = url

        DispatchQueue.main.async {
            self.view?.updateImage(viewModel: viewModel)
        }
    }
}
