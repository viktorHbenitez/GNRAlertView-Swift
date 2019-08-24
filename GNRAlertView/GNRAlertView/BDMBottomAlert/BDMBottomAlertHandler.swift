
// - add the alert with constraints to the ViewController
// - set up, present


import UIKit

// where Self: UIViewController = tell the protocol that we will avaliable to use components to the UIViewController (view, methods, etc)
protocol BDMBottomAlertHandler: class where Self: UIViewController {
    
  var bottomAlert: BDMBottomAlert? { get set }
    
    func presentBottomAlert(message: String, canBeClosed: Bool, animated: Bool)
    func dismissBottomAlert(animated: Bool)
    
}
extension BDMBottomAlertHandler {
    
    //MARK:Private Functions
    private func setUpBottomAlert(_ alert: BDMBottomAlert) {
        view.addSubview(alert)
        alert.translatesAutoresizingMaskIntoConstraints = false
        alert.leftAnchor  .constraint(equalTo: view.leftAnchor)  .isActive = true
        alert.rightAnchor .constraint(equalTo: view.rightAnchor) .isActive = true
        alert.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        alert.layoutIfNeeded()
        bottomAlert = alert
    }
    private func removeBottomAlert() {
        bottomAlert?.removeFromSuperview()
        bottomAlert = nil
    }
    
    //MARK:Protocol Implementation
    internal func presentBottomAlert(message: String, canBeClosed: Bool, animated: Bool) {
        guard bottomAlert == nil else { return }  // need to be nil
        setUpBottomAlert(BDMBottomAlert(handler    : self,  // add to the viewController
                                        message    : message,
                                        canBeClosed: canBeClosed))
        if animated {  // show the alertView
            bottomAlert?.animatePresentation()
        }
    }
    internal func dismissBottomAlert(animated: Bool) {
        if animated {
            bottomAlert?.animateDismissal {
                self.removeBottomAlert()
            }
        } else {
            removeBottomAlert()
        }
    }
    
}
