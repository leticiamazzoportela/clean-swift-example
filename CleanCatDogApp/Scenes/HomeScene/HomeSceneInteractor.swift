//
//  HomeSceneInteractor.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 10/01/23.
//

protocol HomeInteractorProtocol: AnyObject {
    func fetchRandomCat()
    func fetchRandomDog()
}

final class HomeInteractor: HomeInteractorProtocol {
    private let presenter: HomePresenterProtocol
    private let catWorker: CatWorkerProtocol
    private let dogWorker: DogWorkerProtocol

    init(presenter: HomePresenterProtocol, catWorker: CatWorkerProtocol, dogWorker: DogWorkerProtocol) {
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
