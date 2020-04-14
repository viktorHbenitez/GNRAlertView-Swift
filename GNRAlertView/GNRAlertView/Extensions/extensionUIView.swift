//
//  extensionUIView.swift
//  POO-ModalView
//
//  Created by Victor Hugo Benitez Bosques on 4/14/20.
//  Copyright © 2020 Victor Hugo Benitez Bosques. All rights reserved.
//
import UIKit
extension UIView {
    class var identifierView: String { return String(describing: self) }
    func addView(_ subview : UIView, constraintTo anchorView : UIView){
        // add the uiview to the File owner
        addSubview(subview)
        // constraint to the XIB bounderies
        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: self.topAnchor),
            subview.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            subview.leftAnchor.constraint(equalTo: self.leftAnchor),
            subview.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
    }
    
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
    
}
