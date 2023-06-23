//
//  LeagueList.swift
//  Foot
//
//  Created by Aristide LAUGA on 22/06/2023.
//

import SwiftUI

struct LeagueList: View {
  @ObservedObject var leagueViewModel: LeagueViewModel
  @ObservedObject var teamViewModel: TeamViewModel
  var text: String
  var body: some View {
    ForEach(leagueViewModel.leagues.filter { $0.strLeague.localizedCaseInsensitiveContains(teamViewModel.text)}) { suggestion in
      Text(suggestion.strLeague)
        .searchCompletion(suggestion.strLeague)
    }
  }
}

struct LeagueList_Previews: PreviewProvider {
  static var previews: some View {
    LeagueList(leagueViewModel: LeagueViewModel(), teamViewModel: TeamViewModel(), text: "")
  }
}
