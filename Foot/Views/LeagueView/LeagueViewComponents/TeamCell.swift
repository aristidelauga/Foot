//
//  LeagueCell.swift
//  Foot
//
//  Created by Aristide LAUGA on 22/06/2023.
//

import SwiftUI

struct TeamCell: View {
  @ObservedObject var teamViewModel: TeamViewModel
  private let columns = [
    GridItem(.fixed(UIScreen.main.bounds.width / 2), spacing: 5),
    GridItem(.fixed(UIScreen.main.bounds.width / 2), spacing: 5)
  ]
  var body: some View {
    LazyVGrid(columns: columns, alignment: .center) {
      ForEach(teamViewModel.teams) { team in
        NavigationLink(destination: TeamDetailView(team: team)) {
          TeamContent(team: team)
        }
      }
    }
  }
}

struct TeamCell_Previews: PreviewProvider {
  static var previews: some View {
    TeamCell(teamViewModel: TeamViewModel())
  }
}
