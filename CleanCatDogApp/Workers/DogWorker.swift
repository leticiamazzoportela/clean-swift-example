//
//  DogRequestWorker.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 10/01/23.
//

import Foundation
import Combine

protocol DogWorkerProtocol: AnyObject {
    func fetchRandomDog(completion: @escaping (DogResponseModel) -> Void)
}

final class DogWorker: DogWorkerProtocol {
    let dogService: RequestsProtocol
    private var requests = [AnyCancellable]()

    init(dogService: RequestsProtocol) {
        self.dogService = dogService
    }

    func fetchRandomDog(completion: @escaping (DogResponseModel) -> Void) {
        self.dogService.get(url: URL(string: EndPoints.randomDogURL.rawValue)!)
            .sink(
                receiveCompletion: { print($0) },
                receiveValue: { completion($0) }
            )
            .store(in: &requests)
    }
}
