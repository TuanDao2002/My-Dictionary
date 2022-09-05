//
//  UserSettings.swift
//  My Dictionary
//
//  Created by Phi Thai on 05/09/2022.
//

import SwiftUI

struct UserSettings: View {
    
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var viewRouting: ViewRouting
    
    var body: some View {
        ZStack {
            Color("Retro-Pink")
                .ignoresSafeArea()
            VStack {
                Button(action: {
                    viewRouting.state = .mainView
                }, label: {
                    Navigation()
                        .padding(.top, 30)
                        .modifier(LeftAlign())
                        .foregroundColor(.black)
                })
                Text("Setting view")
                Spacer()
                Button("Logout") {
                    userVM.logout()
                    viewRouting.state = .mainView
                }
            }
            .modifier(Padding())
        }
    }
}

struct UserSettings_Previews: PreviewProvider {
    static var previews: some View {
        UserSettings()
    }
}
