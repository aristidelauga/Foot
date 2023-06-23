//
//  FetchingError.swift
//  Foot
//
//  Created by Aristide LAUGA on 22/06/2023.
//

import Foundation

enum FetchingError: Error {
  case badURL
  case noContent
  case decodingIssue
}
