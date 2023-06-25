//
//  Team.swift
//  Foot
//
//  Created by Aristide LAUGA on 22/06/2023.
//

import Foundation

struct LeagueTeams: Codable {
  let teams: [Team]
}

struct Team: Codable, Identifiable {
  var id: String? { return idTeam }
  var idTeam: String?
  var teamName, teamShortName, teamAlternativeName: String?
  var leagueName, idLeague: String?
  var teamDescriptionEN: String?
  var teamDescriptionFR: String?
  var countryName: String?
  var teamBadge: String?
  var teamBanner: String?
  
  enum CodingKeys: String, CodingKey {
    case idTeam = "idTeam"
    case teamName = "strTeam"
    case teamShortName = "strTeamShort"
    case teamAlternativeName = "strAlternate"
    case leagueName = "strLeague"
    case idLeague = "idLeague"
    case teamDescriptionEN = "strDescriptionEN"
    case teamDescriptionFR = "strDescriptionFR"
    case countryName = "strCountry"
    case teamBadge = "strTeamBadge"
    case teamBanner = "strTeamBanner"
  }
  
}
