//
//  CatRequestWorker.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 10/01/23.
//

import Foundation
import Combine

protocol CatWorkerProtocol: AnyObject {
    func fetchRandomCat(completion: @escaping (String) -> Void)
}

final class CatWorker: CatWorkerProtocol {
    let catService: CatRequestsProtocol
    private var requests = [AnyCancellable]()

    init(catService: CatRequestsProtocol) {
        self.catService = catService
    }

    func fetchRandomCat(completion: @escaping (String) -> Void) {
        self.catService.fetchRandomCat()
            .sink(
                receiveCompletion: { print($0) },
                receiveValue: { completion($0.url ?? "") }
            )
            .store(in: &requests)
    }
}
