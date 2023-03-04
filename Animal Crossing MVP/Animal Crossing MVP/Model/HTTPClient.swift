//
//  HTTPClient.swift
//  Animal Crossing MVP
//
//  Created by Johandre Delgado Moreno on 3/4/23.
//

import Foundation

protocol HTTPClient {
  func get(from url: URL, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void)
}

final class DefaultHTTPClient: HTTPClient {
  
  func get(from url: URL, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
    URLSession.shared.dataTask(with: url) { data, response, error  in
      
      if let error = error {
        completion(.failure(error))
        return
      }
      
      guard let data = data, let response = response as? HTTPURLResponse
      else {
        completion(.failure(NetworkError.invalidResponse))
        return
      }
      completion(.success((data, response)))
    }
    .resume()
  }
  
}

