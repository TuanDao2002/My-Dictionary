//
//  WordListHistory.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct WordListHistory: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var viewRouting: ViewRouting
    
    @State private var isLoading = false
        
    var body: some View {
        ZStack {
            Color("Retro-Red")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Button(action: {
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
                        SearchHistory(isLoading: $isLoading)
                        Spacer()
                    }
                }
                .padding(.top, 10)
            }
            .modifier(Padding())
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
