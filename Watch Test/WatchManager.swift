//
//  WatchManager.swift
//  Watch Test
//
//  Created by Rohan Kevin Broach on 7/2/19.
//  Copyright © 2019 rkbroach. All rights reserved.
//

import Foundation
import WatchConnectivity

class WatchManager: NSObject {
    
    static let shared: WatchManager = WatchManager() // singelton object
    
    fileprivate var watchSession: WCSession?
    
    override init() {
        super.init()
        if (!WCSession.isSupported()) {
            watchSession = nil
            return
        }
        watchSession = WCSession.default
        watchSession?.delegate = self
        watchSession?.activate()
    }
    
    func sendToWatch(dict: [String: Any]) {
        do {
            try watchSession?.updateApplicationContext(dict)
        } catch {
            print("Error sending dictionary \(dict) to Apple Watch")
        }
    }

}


extension WatchManager: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidComplete")
    }
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("sessionDidBecomeInactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("sessionDidDeactivate")
    }
}
