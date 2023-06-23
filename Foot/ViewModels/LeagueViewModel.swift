//
//  SoccerViewModel.swift
//  Foot
//
//  Created by Aristide LAUGA on 22/06/2023.
//

import Foundation

class LeagueViewModel: ObservableObject {
  @Published var leagues: [League] = []

  init() {
    Task {
      self.leagues = try await LeagueAPICall.fetchLeagues()
    }
  }
}
