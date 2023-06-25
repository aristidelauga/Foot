//
//  TeamContent.swift
//  Foot
//
//  Created by Aristide LAUGA on 23/06/2023.
//

import SwiftUI

struct TeamListItem: View {
  var team: Team
    var body: some View {
      VStack {
        AsyncImage(url: URL(string: team.teamBadge ?? "")) { image in
          image.resizable()
            .frame(maxWidth: 180, maxHeight: 220)
            .aspectRatio(contentMode: .fill)
        } placeholder: { ProgressView() }
		  // Pas demandé sur la maquette du test
        Text(team.teamName ?? "")
      }
    }
}

struct TeamListItem_Previews: PreviewProvider {
    static var previews: some View {
		TeamListItem(team: Team.sample)
    }
}
