//
//  BannerView.swift
//  Foot
//
//  Created by Aristide LAUGA on 23/06/2023.
//

import SwiftUI

struct BannerView: View {
  var team: Team
  var body: some View {
    AsyncImage(url: URL(string: team.strTeamBanner ?? "")) { image in
      image.resizable()
		// Ne pas utiliser UISCreen.main.bounds.width
        .frame(maxWidth: UIScreen.main.bounds.width)
        .aspectRatio(contentMode: .fit)
    } placeholder: { ProgressView() }
  }
}

struct BannerView_Previews: PreviewProvider {
  static var teamAPICallManager = TeamAPICallManager()
  static var previews: some View {
    BannerView(team: teamAPICallManager.sample)
  }
}
