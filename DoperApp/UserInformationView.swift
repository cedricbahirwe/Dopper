//
//  UserInformationView.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//

import SwiftUI

struct UserInformationView: View {
    @EnvironmentObject private var appState: AppState
    let user: DummyUser
    var body: some View {
        VStack {

            Text("User Profile")
                .font(.largeTitle)

            HStack {
                AsyncImage(url: user.image)
                    .frame(width: 60, height: 60)
                    .clipShape(.circle)
                VStack(alignment: .leading) {
                    Text(user.username)
                    Text(user.email)
                }

                Spacer()


            }

            Button("Logout", role: .destructive) {
                appState.logout()
            }
            .buttonStyle(.borderedProminent)

            Spacer()


        }
        .padding()
    }
}

#Preview {
    UserInformationView(user: .sample)
        .environmentObject(AppState())
}
