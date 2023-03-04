//
//  AnimalMapper.swift
//  Animal Crossing MVP
//
//  Created by Johandre Delgado Moreno on 3/4/23.
//

import Foundation

final class AnimalMapper {
    static func map(_ data: Data, from response: HTTPURLResponse) -> Result<[Animal], Error> {
        guard (200...299).contains(response.statusCode) else {
            return .failure(NetworkError.invalidResponse)
        }
        
        do {
            let root = try JSONDecoder().decode([String: RemoteAnimal].self, from: data)
            return .success(root.map { $0.value.animal })
        } catch {
            print("error", error)
            return .failure(NetworkError.decodingError)
        }
    }
}

private extension AnimalMapper {
    private struct RemoteAnimal: Decodable {
        let id: Int
        let personality: String
        
        var animal: Animal {
            .init(id: id, personality: personality)
        }
    }
}
