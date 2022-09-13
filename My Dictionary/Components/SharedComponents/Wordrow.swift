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
    var msg: String
    init(title: String, userVM: UserViewModel, msg: String) {
        self.title = title
        self.userVM = userVM
        self.msg = msg
        if (!userVM.isLogin()) {
            isFavorite = false
        } else if (!userVM.getUserFavoriteWords()
            .contains(where: {$0.caseInsensitiveCompare(title) == .orderedSame})) {
            isFavorite = false
        } else {
            isFavorite = true
        }
    }
    
    var body: some View {
        HStack{
            Image(systemName: isFavorite ? "star.fill" : "star")
                .foregroundColor(Color("Retro-Blue"))
                .font(.system(.title2))
            Text(title.firstCapitalized)
                .subText()
                .foregroundColor(.black)
                .padding(.leading, 10)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color("Dark-Green"))
        }
        .padding()
        .frame(maxHeight: 65)
        .background(.white)
        .cornerRadius(10)
    }
}

struct TopWord_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            WordRow(title: "Student", userVM: UserViewModel.obj, msg: "").background(.white)
        }.background(Color("Retro-Red"))
        
    }
}
