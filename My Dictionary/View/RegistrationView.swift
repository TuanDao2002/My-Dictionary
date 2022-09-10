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
    case Username
    case Password
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
    
    @State private var showingAlert = false
    
    @FocusState private var loginFieldFocus: LogInField?
    
    @State private var isLoading: Bool = false
    var body: some View {
        ZStack{
            // Background color
            Color("Retro-Brown")
                .ignoresSafeArea()
            VStack {
                Button(action: {
                    viewRouting.state = .mainView
                }, label: {
                    Navigation()
                        .padding(.top, 30)
                        .modifier(LeftAlign())
                        .foregroundColor(Color("Retro-Gray"))
                })
                
                Text("User Registration")
                    .title()
                    .modifier(LeftAlign())
                Spacer()
                
                //Username
                InputField(header: "Username", textFieldName: "", name: $username)
                    .focused($loginFieldFocus, equals: .Username)
                    .onSubmit {
                        loginFieldFocus = .Password
                    }
                
                Spacer()
                    .frame(height: 30)
                
                //Password
                PasswordField(header: "Password", textFieldName: "", name: $password)
                    .focused($loginFieldFocus, equals: .Password)
                    .onSubmit {
                        loginFieldFocus = .Username
                    }
                Spacer()
                    .frame(height: 50)
                HStack {
                    //Register button
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
                    
                    //Log in button
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    loginFieldFocus = .Username
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
