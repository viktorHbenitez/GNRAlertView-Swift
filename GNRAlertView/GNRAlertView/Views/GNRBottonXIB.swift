//
//  GNRBottonXIB.swift
//  POO-ModalView
//
//  Created by Victor Hugo Benitez Bosques on 3/3/20.
//  Copyright © 2020 Victor Hugo Benitez Bosques. All rights reserved.
//

import UIKit

protocol GNRBottonXIBHandler where Self : UIViewController{
    func presentAlert(_ txtCustomString : String, with animated : Bool)
    var gnrView : GNRBottonXIB? { get set }
}

extension GNRBottonXIBHandler{

  
    func presentAlert(_ txtCustomString : String, with animated : Bool = false){
        guard gnrView == nil else {return} // if is nil, it will continue
        setUpView(GNRBottonXIB(self, txtCustomString))
        
        if animated{
            gnrView?.animatePresentation{
                print("Completed the animated")
            }
        }
    }
    func removewGNRView(_ animated : Bool){
        gnrView?.removeAnimationView {
            self.gnrView?.removeFromSuperview()
            self.gnrView = nil
        }
     
    }

    private func setUpView(_ customView : GNRBottonXIB){
        view.addSubview(customView) // add to viewController
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.leftAnchor  .constraint(equalTo: view.leftAnchor)  .isActive = true
        customView.rightAnchor .constraint(equalTo: view.rightAnchor) .isActive = true
        customView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        customView.layoutIfNeeded()
        gnrView = customView
    }
}

class GNRBottonXIB: UIView {
    @IBOutlet weak var lblTitle : UILabel!
    
    private weak var delegate : GNRBottonXIBHandler?
    
    
    convenience init( _ isBool : Bool) {
        self.init()
        addGeneriView()
        lblTitle.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
    }
    
    // MARK: - Initializer
    convenience init(_ delegate : GNRBottonXIBHandler, _ txtChange : String ) {
        self.init()
        // MARK: - invoke XIB and embed the XIB
        
        backgroundColor = .red
        if let content = initXIB(){
            content.backgroundColor = UIColor.yellow
            addSubview(content)
            self.delegate = delegate
            lblTitle.text = txtChange
        }
        
    }
    
    func animatePresentation(completion: (()->())? = nil) {
          center.y += frame.height // change the init coordinated (0,0)
          UIView.animate(withDuration: 0.35,
                         animations  :
              {
                  self.center.y -= self.frame.height // then return to the origin coordinate
          }) { (_) in
              completion?()
          }
    }
    
    func removeAnimationView(completion: (() -> ())? = nil){
        UIView.animate(withDuration: 0.35,
                       animations  :
            {
                self.center.y += self.frame.height
        }) { (_) in
           print("just animation the view")
            completion?()
        }
        
        
    }
    
    
    func addGeneriView(){
        if let xib = Bundle.main.loadNibNamed(GNRBottonXIB.identifierView, owner: self, options: nil)?.first as? UIView{
            xib.backgroundColor = .red
            addView(xib, constraintTo: self)
        }
    }
    
    
    @IBAction func tappedAction(){
        print("Tapped")
        self.delegate?.removewGNRView(true)
    }
    
}

