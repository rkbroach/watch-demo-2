import UIKit
import WatchConnectivity

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var toWatchField: UITextField!
    @IBOutlet weak var fromWatchLabel: UILabel!
    
    let session = WCSession.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(messageReceived), name: NSNotification.Name(rawValue: "receivedWatchMessage"), object: nil)
    }
    
    @IBAction func sendToWatchTapped(_ sender: UIButton) {
        if self.session.isPaired == true && self.session.isWatchAppInstalled {
            self.session.sendMessage(["msg":self.toWatchField.text!], replyHandler: nil, errorHandler: nil)
        }
    }
    
    @objc func messageReceived(info: NSNotification) {
        let message = info.userInfo!
        
        DispatchQueue.main.async {
            self.fromWatchLabel.text = message["msg"] as? String
        }
    }
    

}
