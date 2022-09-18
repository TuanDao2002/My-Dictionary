/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Nguyen Vu Thuy Duong
  ID: s3865443
  Created date: 04/09/2022
  Last modified: 16/09/2002
  Acknowledgement:
    1. https://designcode.io/swiftui-handbook-lottie-animation
    2. https://developer.apple.com/tutorials/swiftui/animating-views-and-transitions
*/

import SwiftUI

@main
struct My_DictionaryApp: App {
    // requires to take the information of the user
    @EnvironmentObject var userVM: UserViewModel
    // requires to change view
    @StateObject var viewRouting = ViewRouting()
    
    @State var isActive:Bool = false
    
    var body: some Scene {
        WindowGroup {
            VStack {
                if self.isActive {
                    rootView
                        .environmentObject(viewRouting)
                        .environmentObject(UserViewModel.obj)
                        .environmentObject(WordViewModel())
                } else {
                    // display the LottieView/ SplashView before running into the main function of the application
                    LottieView(name: "dictionary", loopMode: .playOnce)
                }
            }
            .onAppear {
                // check if the running time for the LottieView is finished yet to display mainView of the app
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    withAnimation(.easeInOut){
                        self.isActive = true
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    // define view for different transition case of the viewRouting
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
