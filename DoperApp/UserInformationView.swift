//
//  UserInformationView.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//

import SwiftUI

struct UserInformationView: View {
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

            Spacer()


        }
        .padding()
    }
}

#Preview {
    UserInformationView(user: .sample)
}
