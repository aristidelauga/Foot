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
          Text(team.countryName ?? "")
          Text(team.leagueName ?? "")
            .bold()
        }
        .padding(.leading, 5)
        
        HStack {
          Spacer()
          Text(team.teamDescriptionFR ?? team.teamDescriptionEN ?? "")
          Spacer()
        }
      }
      .navigationBarTitle(team.teamName ?? "")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct TeamDetailView_Previews: PreviewProvider {
  static var previews: some View {
    TeamDetailView(team: Team.sample)
  }
}
