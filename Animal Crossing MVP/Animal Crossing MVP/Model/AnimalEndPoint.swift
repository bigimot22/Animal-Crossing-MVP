//
//  AnimalEndPoint.swift
//  Animal Crossing MVP
//
//  Created by Johandre Delgado Moreno on 3/5/23.
//

import Foundation

enum AnimalEndPoint {
  case animals
    
  func url(baseURL: URL) -> URL {
    switch self {
    case .animals:
      var components = URLComponents()
      components.scheme = baseURL.scheme
      components.host = baseURL.host
      components.path = baseURL.path + "/v1/villagers/"
      return components.url!
    }
  }
}
