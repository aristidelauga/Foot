//
//  TeamDetailView.swift
//  Foot
//
//  Created by Aristide LAUGA on 23/06/2023.
//

import SwiftUI

struct TeamDetailView: View {
  var team: Team
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .leading, spacing: 5) {
        BannerView(team: team)
          .frame(alignment: .center)
        VStack(alignment: .leading, spacing: 5) {
          Text(team.strCountry ?? "")
          Text(team.strLeague ?? "")
            .bold()
        }
        .padding(.leading, 5)
        
        HStack {
          Spacer()
          Text(team.strDescriptionFR ?? team.strDescriptionEN ?? "")
          Spacer()
        }
      }
      .navigationBarTitle(team.strTeam ?? "")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct TeamDetailView_Previews: PreviewProvider {
  static var teamAPICallManager = TeamAPICallManager()
  static var previews: some View {
    TeamDetailView(team: teamAPICallManager.sample)
  }
}
