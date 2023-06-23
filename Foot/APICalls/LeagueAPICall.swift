//
//  LeagueAPICall.swift
//  Foot
//
//  Created by Aristide LAUGA on 22/06/2023.
//

import Foundation

struct LeagueAPICall {
  static func fetchLeagues() async throws -> [League] {
    let league = Task { () -> [League] in
      guard let url = URL(string: "https://www.thesportsdb.com/api/v1/json/50130162/all_leagues.php") else {
        throw FetchingError.badURL
      }

      let (data, response) = try await URLSession.shared.data(from: url)
      
      guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw FetchingError.noContent
      }
      
      guard let decodedResponse = try? JSONDecoder().decode(SoccerLeague.self, from: data) else {
        throw FetchingError.decodingIssue
      }
      
      return decodedResponse.leagues
    }
    return try await league.value
  }
}
