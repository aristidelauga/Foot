//
//  TeamViewModel.swift
//  Foot
//
//  Created by Aristide LAUGA on 22/06/2023.
//

import Foundation
import UIKit

class TeamViewModel: ObservableObject {
  @Published var teams = [Team]()
  @Published var text = ""
  
  private var teamAPICall = TeamAPICall()
  
  internal func filterTeams(from team: [Team]) -> [Team] {
    var filteredTeams: [Team] = []
    for index in 0..<teams.count {
      if (index % 2) == 0 {
        filteredTeams.append(teams[index])
      }
    }
    filteredTeams = filteredTeams.sorted { $1.teamName ?? "" < $0.teamName ?? "" }
    return filteredTeams
  }

  @MainActor
  func fetchTeam(from league: String) async throws {
    Task {
      do {
        self.teams = try await teamAPICall.fetchTeams(from: league)
        self.teams = filterTeams(from: self.teams)
      } catch {
        print(error.localizedDescription)
      }
    }
    UIApplication.shared.dismissKeyboard()
  }
  
  
}
