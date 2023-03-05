//
//  AnimalService.swift
//  Animal Crossing MVP
//
//  Created by Johandre Delgado Moreno on 3/4/23.
//

import Foundation

protocol AnimalService {
    func getAnimals(completion: @escaping (Result<[Animal], Error>) -> Void)
}

final class RemoteAnimalService: AnimalService {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func getAnimals(completion: @escaping (Result<[Animal], Error>) -> Void) {
        let url = AnimalEndPoint.animals.url(baseURL: Constants.baseURL)
        client.get(from: url) { result in
            switch result {
                
            case let .success((data, response)):
                completion(AnimalMapper.map(data, from: response))
            case .failure(_):
                completion(.failure(NetworkError.connectionError))
            }
        }
    }
}
