//
//  TeamViewModel.swift
//  Foot
//
//  Created by Aristide LAUGA on 22/06/2023.
//

import Combine
import Foundation

@MainActor
class TeamViewModel: ObservableObject {
  @Published var teams = [Team]()
  @Published var text = ""
  
  internal func filterTeams(from team: [Team]) -> [Team] {
    var filteredTeams: [Team] = []
    for index in 0..<teams.count {
      if (index % 2) == 0 {
        filteredTeams.append(teams[index])
      }
    }
    filteredTeams = filteredTeams.sorted { $1.strTeam ?? "" < $0.strTeam ?? "" }
    return filteredTeams
  }
  
  func fetchTeam(from league: String) async throws {
    
    var teamURL: URLComponents {
      var teamComponents = URLComponents()
      teamComponents.scheme = "https"
      teamComponents.host = "thesportsdb.com"
      teamComponents.path = "/api/v1/json/50130162/search_all_teams.php"
      teamComponents.queryItems = [URLQueryItem(name: "l", value: league)]
      return teamComponents
    }
    
    let teams = Task { () -> [Team] in
      
      guard let url = teamURL.url else {
        throw FetchingError.badURL
      }
      
      let (data, response) = try await URLSession.shared.data(from: url)
      
      guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw FetchingError.noContent
      }
      
      guard let decodedResponse = try? JSONDecoder().decode(LeagueTeams.self, from: data) else {
        throw FetchingError.decodingIssue
      }
      
      return decodedResponse.teams
    }
    
    self.teams = try await teams.value
    self.teams = filterTeams(from: self.teams)
    
  }
}
