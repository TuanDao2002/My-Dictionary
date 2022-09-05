//
//  SearchHistory.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI


struct SearchHistory: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var viewRouting: ViewRouting
    
    var body: some View {
        VStack{
            ForEach(userVM.getUserSearchedWords(), id: \.self) { word in
                Button(action: {
                    viewRouting.state = .wordView
                }, label: {
                    WordRow(title: word)
                })
            }
        }
    }
}

struct SearchHistory_Previews: PreviewProvider {
    static var previews: some View {
        SearchHistory()
            .environmentObject(UserViewModel.obj)
            .environmentObject(ViewRouting())
    }
}
