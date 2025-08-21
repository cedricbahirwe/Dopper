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

    let heeaderBgHeight: CGFloat = 180

    var body: some View {
        ZStack(alignment: .top) {
            Color.orange
                .ignoresSafeArea()
                .frame(height: heeaderBgHeight)

            VStack {
                VStack {
                    AsyncImage(
                        url: user.image,
                        content: { image in
                            image.resizable()
                                .scaledToFit()
                        },
                        placeholder: {
                            ProgressView()
                                .scaleEffect(2)
                                .tint(.orange)
                        }
                    )
                    .padding(30)
                    .frame(width: 150, height: 150)
                    .background(.gray.gradient)
                    .clipShape(.circle)
                    .padding(8)
                    .background(.black)
                    .clipShape(.circle)
                    .shadow(color: .white.opacity(0.3), radius: 10)
                    .shadow(color: .white.opacity(0.3), radius: 10, y: -5)
                    .padding(.top, heeaderBgHeight - 75)

                    HStack {
                        Text(user.firstName)
                        Text(user.lastName)
                    }
                    .font(.title.bold())

                    Form {
                        LabeledContent("Username", value: user.username)
                        LabeledContent("Email", value: user.email)

                        Section("Person") {
                            LabeledContent("Genre", value: user.gender.rawValue.capitalized)
                        }
                        .textCase(.none)
                    }
                }

                Button(role: .destructive) {
                    appState.logout()
                } label: {
                    Text("Logout")
                        .tint(.red)
                        .padding(6)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 15))
                .tint(.red)

                .padding()
            }
        }
    }
}

#Preview {
    UserInformationView(user: .sample)
        .environmentObject(AppState())
        .preferredColorScheme(.dark)
}
