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
    private var catWorker: CatWorkerProtocol
    private var dogWorker: DogWorkerProtocol

    init(catWorker: CatWorkerProtocol, dogWorker: DogWorkerProtocol) {
        self.catWorker = catWorker
        self.dogWorker = dogWorker
    }

    func fetchRandomCat() {
        // TODO
    }

    func fetchRandomDog() {
        // TODO
    }


}
