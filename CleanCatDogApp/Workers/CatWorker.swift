//
//  CatRequestWorker.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 10/01/23.
//

import Foundation
import Combine

protocol CatWorkerProtocol: AnyObject {
    func fetchRandomCat(completion: @escaping (CatResponseModel) -> Void)
}

final class CatWorker: CatWorkerProtocol {
    let catService: RequestsProtocol
    private var requests = [AnyCancellable]()

    init(catService: RequestsProtocol) {
        self.catService = catService
    }

    func fetchRandomCat(completion: @escaping (CatResponseModel) -> Void) {
        self.catService.get(url: URL(string: EndPoints.randomCatURLWithQueryParam.rawValue)!)
            .sink(
                receiveCompletion: { print($0) },
                receiveValue: { completion($0) }
            )
            .store(in: &requests)
    }
}
