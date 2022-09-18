/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Nguyen Vu Thuy Duong
  ID: s3865443
  Created date: 31/08/2022
  Last modified: 16/09/2002
  Acknowledgement:
    1. https://fxstudio.dev/swiftui-phan-9-routing-in-swiftui/
*/

import SwiftUI

// this struct present for the search history view of the application
struct WordListHistory: View {
    // requires userViewModel to take the information from the user
    @EnvironmentObject var userVM: UserViewModel
    // requires viewRouting to direct to different views
    @EnvironmentObject var viewRouting: ViewRouting
    
    // Boolean variable to check whether the process is loading or not
    @State private var isLoading = false
        
    var body: some View {
        ZStack {
            Color("Retro-Red")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Button(action: {
                    // return to mainView
                    viewRouting.state = .mainView
                }, label: {
                    Navigation()
                })
                
                ScrollView(showsIndicators: false){
                    VStack (alignment: .leading){
                        Text("Search History")
                            .title()
                            .modifier(LeftAlign())
                        Spacer()
                            .frame(height: 60)
                        // show the list of words that user recently search
                        SearchHistory(isLoading: $isLoading)
                        Spacer()
                    }
                }
                .padding(.top, 10)
            }
            .modifier(Padding())
            // display notification if the process is loading 
            Notification(check: isLoading, text: "Loading...")
                .transition(AnyTransition.opacity.animation(.easeInOut))
        }
    }
}

struct WordListHistory_Previews: PreviewProvider {
    static var previews: some View {
        WordListHistory()
            .environmentObject(UserViewModel.obj)
    }
}
