//
//  My_DictionaryApp.swift
//  My Dictionary
//
//  Created by Tuan Dao on 30/08/2022.
//

import SwiftUI

@main
struct My_DictionaryApp: App {
    @EnvironmentObject var userVM: UserViewModel
    @StateObject var viewRouting = ViewRouting()
    
    
    var body: some Scene {
        WindowGroup {
            rootView
                .environmentObject(viewRouting)
                .environmentObject(UserViewModel.obj)
                .environmentObject(WordViewModel())
        }
    }
    
    @ViewBuilder
        var rootView: some View {
            switch viewRouting.state {
            case .mainView:
                MainView()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            case .historyView:
                WordListHistory()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            case .registrationView:
                RegistrationView()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            case .wordView:
                WordContentView()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            case .test:
                Test()
            case .userSetting:
                UserSettings()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }

        }
}
