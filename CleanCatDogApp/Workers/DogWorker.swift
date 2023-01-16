//
//  DogRequestWorker.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 10/01/23.
//

import Foundation
import Combine

protocol DogWorkerProtocol: AnyObject {
    func fetchRandomDog(completion: @escaping (String) -> Void)
}

final class DogWorker: DogWorkerProtocol {
    let dogService: DogRequestsProtocol
    private var requests = [AnyCancellable]()

    init(dogService: DogRequestsProtocol) {
        self.dogService = dogService
    }

    func fetchRandomDog(completion: @escaping (String) -> Void) {
        self.dogService.fetchRandomDog()
            .sink(
                receiveCompletion: { print($0) },
                receiveValue: { completion($0.url ?? "") }
            )
            .store(in: &requests)
    }
}
