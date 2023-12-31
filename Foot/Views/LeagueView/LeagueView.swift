//
//  LeagueView.swift
//  Foot
//
//  Created by Aristide LAUGA on 21/06/2023.
//

import SwiftUI

struct LeagueView: View {
  @ObservedObject var leagueViewModel: LeagueViewModel
  @ObservedObject var teamViewModel: TeamViewModel
  @State private var currentSelection: String? = nil
  @Environment(\.isSearching)
  private var isSearching: Bool
  
  var body: some View {
    NavigationStack {
      ScrollView(.vertical, showsIndicators: false) {
        TeamsList(teamViewModel: teamViewModel)
      }
    }
    .searchable(text: $teamViewModel.text, prompt: "Search by league", suggestions: {
      if !isSearching || !teamViewModel.text.isEmpty {
        LeagueList(leagueViewModel: leagueViewModel, teamViewModel: teamViewModel, text: teamViewModel.text)
      }
    })
    .onSubmit(of: .search) {
      Task {
        do {
          try await teamViewModel.fetchTeam(from: teamViewModel.text)
        } catch {
          print(error.localizedDescription)
        }
      }
    }
  }
}

struct LeagueView_Previews: PreviewProvider {
  static var previews: some View {
    LeagueView(leagueViewModel: LeagueViewModel(), teamViewModel: TeamViewModel())
  }
}
