//
//  TeamViewModel.swift
//  Foot
//
//  Created by Aristide LAUGA on 22/06/2023.
//

import Combine
import Foundation

class TeamViewModel: ObservableObject {
  @Published var teams = [Team]()
  @Published var text = ""
  //  {
  //    didSet {
  //      print(text)
  //      Task {
  //        do {
  //          teams = try await TeamAPICall.fetchTeams(from: text)
  //        } catch {
  //          throw FetchingError.decodingIssue
  //        }
  //      }
  //    }
  //  }
  
  //  func fetchTeams(from league: String) async throws  {
  //    do {
  //      self.teams = try await TeamAPICall.fetchTeams(from: league)
  //    } catch {
  //      print("Error fetching teams related data")
  //    }
  //  }
  
  func fetchTeam(from league: String) async throws {
    var teamURL: URLComponents {
      var teamComponents = URLComponents()
      teamComponents.scheme = "https"
      teamComponents.host = "thesportsdb.com"
      teamComponents.path = "/api/v1/json/50130162/search_all_teams.php?"
      teamComponents.queryItems = [URLQueryItem(name: "l", value: league)]
      return teamComponents
    }
    
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
    
    self.teams = decodedResponse.teams
    
  }
  
}