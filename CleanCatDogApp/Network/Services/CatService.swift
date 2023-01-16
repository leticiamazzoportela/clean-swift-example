//
//  CatService.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 16/01/23.
//

import Foundation
import Combine

protocol CatRequestsProtocol: AnyObject {
    func fetchRandomCat() -> AnyPublisher<CatResponseModel, Error>
}

final class CatService: CatRequestsProtocol {
    func fetchRandomCat() -> AnyPublisher<CatResponseModel, Error> {
        let url = URL(string: EndPoints.randomCat.rawValue)!

        return URLSession.shared
            .dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: CatResponseModel.self, decoder: JSONDecoder())
            .catch { _ in Empty<CatResponseModel, Error>() }
            .eraseToAnyPublisher()
    }
}

