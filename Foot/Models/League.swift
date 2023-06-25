//
//  League.swift
//  Foot
//
//  Created by Aristide LAUGA on 22/06/2023.
//

import Foundation

struct SoccerLeague: Codable {
  let leagues: [League]
}

struct League: Codable, Identifiable {
  var id: String { return idLeague }
  let idLeague: String
  let leagueName: String
  let sportName: String
  let alternateLeagueName: String?
  
  enum CodingKeys: String, CodingKey {
    case idLeague = "idLeague"
    case leagueName = "strLeague"
    case sportName = "strSport"
    case alternateLeagueName = "strLeagueAlternate"
  }
  
}
