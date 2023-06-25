//
//  TeamContent.swift
//  Foot
//
//  Created by Aristide LAUGA on 23/06/2023.
//

import SwiftUI

struct TeamContent: View {
  var team: Team
    var body: some View {
      VStack {
        AsyncImage(url: URL(string: team.strTeamBadge ?? "")) { image in
          image.resizable()
            .frame(maxWidth: 180, maxHeight: 240)
            .aspectRatio(contentMode: .fill)
        } placeholder: { ProgressView() }
        Text(team.strTeam ?? "")
      }
    }
}

struct TeamContent_Previews: PreviewProvider {
  static var teamAPICallManager = TeamAPICallManager()
    static var previews: some View {
      TeamContent(team: teamAPICallManager.sample)
    }
}
