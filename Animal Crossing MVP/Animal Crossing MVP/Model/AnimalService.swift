//
//  AnimalService.swift
//  Animal Crossing MVP
//
//  Created by Johandre Delgado Moreno on 3/4/23.
//

import Foundation

protocol AnimalService {
    func getCharacters(completion: @escaping (Result<[Animal], Error>) -> Void)
}

final class RemoteAnimalService: AnimalService {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func getCharacters(completion: @escaping (Result<[Animal], Error>) -> Void) {
        let url = URL(string: "https://acnhapi.com/v1/villagers/")!
        client.get(from: url) { result in
            switch result {
                
            case let .success((data, response)):
                print("👀 response code:", response.statusCode)
                completion(AnimalMapper.map(data, from: response))
            case .failure(_):
                completion(.failure(NetworkError.connectionError))
            }
        }
    }
}
