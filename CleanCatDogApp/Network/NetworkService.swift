//
//  NetworkService.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 19/01/23.
//

import Foundation
import Combine

protocol RequestsProtocol: AnyObject {
    func get<T: Decodable>(url: URL) -> AnyPublisher<T, Error>
}

final class NetworkService: RequestsProtocol {
    func get<T>(url: URL) -> AnyPublisher<T, Error> where T : Decodable {
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .catch { _ in Empty<T, Error>() }
            .eraseToAnyPublisher()
    }
}
