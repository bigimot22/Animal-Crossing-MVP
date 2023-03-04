//
//  NetworkError.swift
//  Animal Crossing MVP
//
//  Created by Johandre Delgado Moreno on 3/4/23.
//

import Foundation

enum NetworkError: Error {
  case connectionError
  case invalidResponse
  case decodingError
}
