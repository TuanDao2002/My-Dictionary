/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Nguyen Vu Thuy Duong
  ID: s3865443
  Created date: 04/09/2022
  Last modified: 16/09/2002
  Acknowledgement: 1. https://fxstudio.dev/swiftui-phan-9-routing-in-swiftui/
*/

import Foundation
import SwiftUI

// this class is used to navigate the view over the application instead of using NavigationLink()
class ViewRouting: ObservableObject {
    // variable to set the current state displaying on the screen of the application
    @Published var state: ViewState = .mainView
    // variable to set the previous display view of the app -> the app would return to the correct view
    @Published var prevState: ViewState = .mainView
}

// enum, list of the contained views in the application
enum ViewState {
    case mainView
    case historyView
    case registrationView
    case wordView
    case test
    case userSetting
}

