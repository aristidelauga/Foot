//
//  SoccerViewModel.swift
//  Foot
//
//  Created by Aristide LAUGA on 22/06/2023.
//

import Foundation

class LeagueViewModel: ObservableObject {
  @Published var leagues: [League] = []
  
  private var leagueAPIManager = LeagueAPICall()
  
  init() {
    Task { [weak self] in
      await self?.loadLeagues()
    }
  }
  
  @MainActor
  func loadLeagues() {
    Task {
      do {
        self.leagues = try await leagueAPIManager.fetchLeagues()
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
  func reorderedLeague(_ text: String) -> [League] {
    return self.leagues.filter { $0.leagueName.localizedCaseInsensitiveContains(text)}
  }
}
