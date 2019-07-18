import Foundation
import WatchKit
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    
    
    @IBOutlet var displayLabel: WKInterfaceLabel!
    
    let session = WCSession.default
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        NotificationCenter.default.addObserver(self, selector: #selector(didReceivePhoneData), name: NSNotification.Name(rawValue: "receivedPhoneData"), object: nil)
    }
    
    @IBAction func buttonTapped() {
        
        self.session.sendMessage(["msg" : "hello rohan"], replyHandler: nil , errorHandler: nil)
    
    }
    
    @objc func didReceivePhoneData(info: NSNotification) {
        let msg = info.userInfo!
        self.displayLabel.setText(msg["msg"] as? String)
        
        
    }
    
    
    
    
}
