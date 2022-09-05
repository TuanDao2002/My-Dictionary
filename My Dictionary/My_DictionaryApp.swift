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
            case .mainView: MainView()
            case .historyView: WordListHistory()
            case .registrationView: RegistrationView()
            case .wordView: WordContentView()
            case .test: Test()
            case .userSetting: UserSettings()
            }
        }
}
