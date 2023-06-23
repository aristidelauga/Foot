//
//  FootApp.swift
//  Foot
//
//  Created by Aristide LAUGA on 21/06/2023.
//

import SwiftUI

@main
struct FootApp: App {
  @StateObject var leagueViewModel = LeagueViewModel()
  @StateObject var teamViewModel = TeamViewModel()
    var body: some Scene {
        WindowGroup {
          LeagueView(leagueViewModel: leagueViewModel, teamViewModel: teamViewModel)
        }
    }
}
