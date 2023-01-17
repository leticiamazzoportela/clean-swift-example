//
//  HomeSceneInteractor.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 10/01/23.
//

protocol HomeSceneInteractorProtocol: AnyObject {
    func fetchRandomCat()
    func fetchRandomDog()
}

final class HomeSceneInteractor: HomeSceneInteractorProtocol {
    private let presenter: HomeScenePresenterProtocol
    private let catWorker: CatWorkerProtocol
    private let dogWorker: DogWorkerProtocol

    init(presenter: HomeScenePresenterProtocol, catWorker: CatWorkerProtocol, dogWorker: DogWorkerProtocol) {
        self.presenter = presenter
        self.catWorker = catWorker
        self.dogWorker = dogWorker
    }

    func fetchRandomCat() {
        self.catWorker.fetchRandomCat { data in
            self.presenter.buildCatImage(with: data)
        }
    }

    func fetchRandomDog() {
        self.dogWorker.fetchRandomDog { data in
            self.presenter.buildDogImage(with: data)
        }
    }
}
