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
    
    @State var isActive:Bool = false
    
//    var body: some View {
//        VStack {
//            // 2.
//            if self.isActive {
//                // 3.
//                MainView()
//            } else {
//                // 4.
//                LottieView(name: "dictionary", loopMode: .playOnce)
//            }
//        }
//        // 5.
//        .onAppear {
//            // 6.
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
//                // 7.
//                withAnimation(.easeInOut){
//                    self.isActive = true
//                }
//            }
//        }
//    }
    var body: some Scene {
        WindowGroup {
            VStack {
                // 2.
                if self.isActive {
                    // 3.
                    rootView
                        .environmentObject(viewRouting)
                        .environmentObject(UserViewModel.obj)
                        .environmentObject(WordViewModel())
                } else {
                    // 4.
                    LottieView(name: "dictionary", loopMode: .playOnce)
                }
            }
            // 5.
            .onAppear {
                // 6.
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    // 7.
                    withAnimation(.easeInOut){
                        self.isActive = true
                    }
                }
            }
//            rootView
//                .environmentObject(viewRouting)
//                .environmentObject(UserViewModel.obj)
//                .environmentObject(WordViewModel())
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
