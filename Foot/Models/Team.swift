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
  var strTeam, strTeamShort, strAlternate: String?
  var strLeague, idLeague: String?
  var strDescriptionEN: String?
  var strDescriptionFR: String?
  var strCountry: String?
  var strTeamBadge: String?
  var strTeamBanner: String?
}
