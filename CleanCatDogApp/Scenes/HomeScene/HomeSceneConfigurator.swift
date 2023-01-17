//
//  HomeSceneConfigurator.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 16/01/23.
//

protocol HomeSceneConfiguratorProtocol: AnyObject {
    func configureView() -> HomeSceneView
}

final class HomeSceneConfigurator: HomeSceneConfiguratorProtocol {
    func configureView() -> HomeSceneView {
        let catWorker = CatWorker(catService: CatService())
        let dogWorker = DogWorker(dogService: DogService())

        var view = HomeSceneView()
        let presenter = HomeScenePresenter(view: view)
        let interactor = HomeSceneInteractor(presenter: presenter, catWorker: catWorker, dogWorker: dogWorker)

        view.interactor = interactor

        return view
    }
}
