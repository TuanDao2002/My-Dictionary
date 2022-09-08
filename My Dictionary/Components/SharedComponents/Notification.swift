//
//  Notification.swift
//  My Dictionary
//
//  Created by Phi Thai on 08/09/2022.
//

import SwiftUI

struct Notification: View {
    var check: Bool
    
    var body: some View {
        if check {
            ZStack {
                Color.black.opacity(check ? 0.9 : 0)
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    Color("Retro-Skin")
                    VStack{
                        Text("Loading...")
                    }
                    .padding()
                }
                .frame(width: 200, height: 50)
                .cornerRadius(20)
                
            }
        }
    }
}
