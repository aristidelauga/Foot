//
//  TeamImageView.swift
//  Foot
//
//  Created by Aristide LAUGA on 23/06/2023.
//

import SwiftUI

struct TeamImageView: View {
	var team: Team
	var body: some View {
		AsyncImage(url: URL(string: team.teamBadge ?? "")) { image in
			image.resizable()
				.frame(width: 100, height: 100)
		} placeholder: { ProgressView() }
	}
}

struct TeamImageView_Previews: PreviewProvider {
	static var previews: some View {
		TeamImageView(team: Team.teamSample)
	}
}
