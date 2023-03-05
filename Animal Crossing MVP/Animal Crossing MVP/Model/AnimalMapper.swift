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
        let icon_uri: String
        let name: [String: String]
        let personality: String
        let species: String
        
        var animal: Animal {
            .init(
                id: id,
                avatarURL: icon_uri,
                personality: personality,
                species: species,
                name: name["name-USen"] ?? ""
            )
        }
    }
}
