//
//  DogResponseModel.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 16/01/23.
//

struct DogResponseModel: Decodable {
    var url: String?

    enum CodingKeys: String, CodingKey {
        case url = "message"
    }
}
