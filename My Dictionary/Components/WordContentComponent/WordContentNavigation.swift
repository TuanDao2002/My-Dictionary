//
//  WordContentNavigation.swift
//  My Dictionary
//
//  Created by Phi Thai on 02/09/2022.
//

import SwiftUI

struct WordContentNavigation: View {
    @EnvironmentObject var viewRouting: ViewRouting
    
    var body: some View {
        HStack(alignment: .center){
            Button (action: {
                viewRouting.state = .mainView
            }, label: {
                Navigation()
                    .foregroundColor(.black)
            })
            
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
