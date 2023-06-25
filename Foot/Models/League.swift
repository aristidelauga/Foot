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

// J'ai du mal à comprendre les noms des propriétés, tu peux améliorer ça via CodingKey.
struct League: Codable, Identifiable {
  var id: String { return idLeague }
  let idLeague: String
  let strLeague: String
  let strSport: String
  let strLeagueAlternate: String?
}
