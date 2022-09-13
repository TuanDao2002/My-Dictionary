//
//  Button.swift
//  My Dictionary
//
//  Created by Phi Thai on 13/09/2022.
//

import SwiftUI

struct LogInButton: View {
    @EnvironmentObject var userVM: UserViewModel
    
    @Binding var username: String
    @Binding var password: String
    @Binding var msg: String
    @Binding var status: Int
    
    @Binding var isLoading: Bool
    @Binding var showingAlert: Bool
    
    @FocusState var loginFieldFocus: LogInField?
    var body: some View {
        Button() {
            loginFieldFocus = nil
            Task {
                isLoading = true
                userVM.register(username: username, password: password) { msg, status in
                    isLoading = false
                    self.msg = msg
                    self.status = status
                    showingAlert = true
                }
            }
        } label: {
            Text("Register")
                .buttonText()
        }
        .modifier(ButtonModifier())
    }
}

struct RegisterButton: View {
    @EnvironmentObject var userVM: UserViewModel
    
    @Binding var username: String
    @Binding var password: String
    @Binding var msg: String
    @Binding var status: Int
    @Binding var user: User?
    
    @Binding var isLoading: Bool
    @Binding var showingAlert: Bool
    
    @FocusState var loginFieldFocus: LogInField?
    var body: some View {
        Button() {
            loginFieldFocus = nil
            Task {
                isLoading = true
                userVM.login(username: username, password: password) { msg, status in
                    isLoading = false
                    self.msg = msg
                    self.status = status
                    self.user = userVM.getUser()
                    showingAlert = true
                }
            }
        } label: {
            Text("Log in")
                .buttonText()
        }
        .modifier(ButtonModifier())
        .background(Color("Retro-Yellow"))
        .cornerRadius(10)
    }
}

