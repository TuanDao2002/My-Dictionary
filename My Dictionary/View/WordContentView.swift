//
//  WordContentView.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct WordContentView: View {
    var word: Word
    var body: some View {
        Text("Hello \(word.title)")
    }
}

struct WordContentView_Previews: PreviewProvider {
    static var previews: some View {
        WordContentView(word: Word(title: "Student"))
    }
}
