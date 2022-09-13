//
//  Notification.swift
//  My Dictionary
//
//  Created by Phi Thai on 08/09/2022.
//

import SwiftUI

struct Notification: View {
    var check: Bool
    var text: String
    
    var body: some View {
        if check {
            ZStack {
                Color.black.opacity(check ? 0.9 : 0)
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    Color("Retro-Skin")
                    Text(text)
                    .padding()
                }
                .frame(width: 200, height: 100)
                .cornerRadius(20)
                
            }
        }
    }
}
