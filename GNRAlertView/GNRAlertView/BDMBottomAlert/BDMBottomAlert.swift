

// view's outlets and actions
// animation actions
// add XIB
// delegate of the methods protocols

import UIKit

class BDMBottomAlert: UIView {
    
    //MARK:IBOutlets
    @IBOutlet private weak var imvIcon   : UIImageView!
    @IBOutlet private weak var lblMessage: UILabel!
    @IBOutlet private weak var btnClose  : UIButton!
    
    //MARK:Handler
    private weak var handler: BDMBottomAlertHandler?
    
    //MARK:Initializer
    convenience init(handler: BDMBottomAlertHandler?, message: String, canBeClosed: Bool) {
        self.init()
        if let content = initXIB() {
            addSubview(content)
            self.handler        = handler
            lblMessage.text     = message
            btnClose  .isHidden = !canBeClosed
//            layer.setShadowWith(.black,
//                                opacity  : 0.25,
//                                offset   : CGSize(width : 0,
//                                                  height: -4),
//                                andRadius: 5)
        } else {
            backgroundColor = .red
        }
    }
    
    //MARK:Public Functions
    public func animatePresentation(completion: (()->())? = nil) {
      // 1. center of the view top/left = 0.0
      // 2. move the center bottom/left to the end of thecenter.y position
        center.y += frame.height

        UIView.animate(withDuration: 0.35,
                       animations  :
            {
              // 3. Move to the origin posicion center.y (0.0)
                self.center.y -= self.frame.height
            }) { (_) in
                completion?()
            }
    }
    public func animateDismissal(completion: (()->())? = nil)  {
        UIView.animate(withDuration: 0.35,
                       animations  :
            {
              // 1. Move to the end to the center.y position
                self.center.y += self.frame.height
            }) { (_) in
                completion?()
            }
    }
    
    //MARK:IBAction
    @IBAction private func closePushed() {
        handler?.dismissBottomAlert(animated: true)
    }
    
}

extension UIView {
    
    public func initXIB() -> UIView? {
        guard let name = type(of: self).description().components(separatedBy: ".").last,
              let view = UINib(nibName: name,
                               bundle : nil).instantiate(withOwner: self,
                                                         options  : nil).first as? UIView else { return nil }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth,
                                 .flexibleHeight]
        return view
    }
    
//    @discardableResult class func initXIB<Type: UIView>(owner: Type?) -> UIView {
//        let instance = Bundle.main.loadNibNamed(String(describing: self),
//                                                owner  : owner,
//                                                options: nil)?[0] as! UIView
//        instance.autoresizingMask = [.flexibleWidth,
//                                     .flexibleHeight]
//        if let owner = owner {
//            instance.frame = owner.bounds
//            owner.addSubview(instance)
//        }
//        return instance
//    }
  
}
