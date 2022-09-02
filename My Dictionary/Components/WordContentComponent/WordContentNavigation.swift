//
//  WordContentNavigation.swift
//  My Dictionary
//
//  Created by Phi Thai on 02/09/2022.
//

import SwiftUI

struct WordContentNavigation: View {
    var body: some View {
        HStack(alignment: .center){
            Navigation()
            Spacer()
            DropdownMenu()
        }
    }
}

struct WordContentNavigation_Previews: PreviewProvider {
    static var previews: some View {
        WordContentNavigation()
    }
}
