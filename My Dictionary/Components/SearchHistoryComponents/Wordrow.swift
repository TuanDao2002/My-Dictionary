//
//  TopWord.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct WordRow: View {
    var title: String
    var isFavorite: Bool
    var userVM: UserViewModel
    
    init(title: String, userVM: UserViewModel) {
        self.title = title
        self.userVM = userVM
        
        if (!userVM.isLogin()) {
            isFavorite = false
        } else if (!userVM.getUserFavoriteWords().contains(title)) {
            isFavorite = false
        } else {
            isFavorite = true
        }
    }
    
    var body: some View {
        HStack{
            Image(systemName: isFavorite ? "star.fill" : "star").foregroundColor(Color("Soft-purple")).disabled(title == "Word not found" ? true : false).opacity(title == "Word not found" ? 0 : 1)
            Spacer()
            Text(title.firstCapitalized).font(.custom("Inter", size: 15)).foregroundColor(.black)
            Spacer()
            Image(systemName: "chevron.right").foregroundColor(Color("Retro-Gray")).disabled(title == "Word not found" ? true : false).opacity(title == "Word not found" ? 0 : 1)
        }.padding().background(.white).cornerRadius(10)
    }
}

struct TopWord_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            WordRow(title: "Student", userVM: UserViewModel.obj).background(.white)
        }.background(Color("Retro-Red"))
        
    }
}
