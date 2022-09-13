//
//  RegistrationView.swift
//  My Dictionary
//
//  Created by Phi Thai on 31/08/2022.
//
// Note to change view to both register and log in session view
// so add one more button to the view

import SwiftUI

enum LogInField {
    case username
    case password
}

struct RegistrationView: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var wordVM: WordViewModel
    
    // Global variable to change view of app
    @EnvironmentObject var viewRouting: ViewRouting
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var msg: String = ""
    @State private var status: Int = -1
    @State private var user: User?
    
    @State private var isLoading: Bool = false
    @State private var showingAlert = false
    
    @FocusState private var loginFieldFocus: LogInField?
    
    var body: some View {
        ZStack{
            // Background color
            Color("Retro-Brown")
                .ignoresSafeArea()
            VStack {
                Button(action: {
                    viewRouting.state = .mainView
                    loginFieldFocus = nil
                }, label: {
                    Navigation()
                })
                
                Text("User Registration")
                    .title()
                    .modifier(LeftAlign())
                Spacer()
                
                //USERNAME INPUT FIELD HERE
                InputField(header: "Username", textFieldName: "", name: $username)
                    .focused($loginFieldFocus, equals: .username)
                    .onSubmit {
                        loginFieldFocus = .password
                    }
                
                Spacer()
                    .frame(height: 30)
                
                //PASSWORD INPUT FIELD HERE
                PasswordField(header: "Password", textFieldName: "", name: $password)
                    .focused($loginFieldFocus, equals: .password)
                    .onSubmit {
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
                    }
                Spacer()
                    .frame(height: 50)
                HStack {
                    //Log in button
                    LogInButton(username: $username, password: $password, msg: $msg, status: $status, isLoading: $isLoading, showingAlert: $showingAlert, loginFieldFocus: _loginFieldFocus)
                    
                    //Register button
                    RegisterButton(username: $username, password: $password, msg: $msg, status: $status, user: $user, isLoading: $isLoading, showingAlert: $showingAlert, loginFieldFocus: _loginFieldFocus)
                    
                }
                Spacer()
                
            }
            .modifier(Padding())
            .alert("\(msg)", isPresented: $showingAlert) {
                if(msg == "Login successfully") {
                    Button("Return") {
                        viewRouting.state = .mainView
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    loginFieldFocus = .username
                }
            }
            Notification(check: isLoading)
        }
    }
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(ViewRouting())
            .previewDevice("iPhone 11")
    }
}
