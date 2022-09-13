//
//  Network.swift
//  My Dictionary
//
//  Created by Phi Thai on 13/09/2022.
//

import Foundation
import Network

class Network: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    
    @Published private(set) var connected: Bool = false
    
    init() {
            monitor.pathUpdateHandler =  { [weak self] path in
                DispatchQueue.main.async {
                    self?.connected = path.status == .satisfied ? true : false
                }
            }
            monitor.start(queue: queue)
        }
}
