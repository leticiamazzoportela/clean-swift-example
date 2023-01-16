//
//  DogService.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 16/01/23.
//

import Foundation
import Combine

protocol DogRequestsProtocol: AnyObject {
    func fetchRandomDog() -> AnyPublisher<DogResponseModel, Error>
}

final class DogService: DogRequestsProtocol {
    func fetchRandomDog() -> AnyPublisher<DogResponseModel, Error> {
        let url = URL(string: EndPoints.randomDog.rawValue)!

        return URLSession.shared
            .dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: DogResponseModel.self, decoder: JSONDecoder())
            .catch { _ in Empty<DogResponseModel, Error>() }
            .eraseToAnyPublisher()
    }
}
