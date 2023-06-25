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
    AsyncImage(url: URL(string: team.teamBanner ?? "")) { image in
      image
		.resizable()
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .aspectRatio(contentMode: .fit)
    } placeholder: { ProgressView() }
  }
}

struct BannerView_Previews: PreviewProvider {
  static var previews: some View {
	  BannerView(team: Team.teamSample)
  }
}
