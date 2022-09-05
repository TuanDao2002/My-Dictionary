//
//  ViewRouting.swift
//  My Dictionary
//
//  Created by Nguyễn Vũ Thuỳ Dương on 04/09/2022.
//

import Foundation
import SwiftUI

class ViewRouting: ObservableObject {
    @Published var state: ViewState = .test
}

enum ViewState {
    case mainView
    case historyView
    case registrationView
    case wordView
    case test
}
