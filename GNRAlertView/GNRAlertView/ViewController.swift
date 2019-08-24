//
//  ViewController.swift
//  GNRAlertView
//
//  Created by Victor Hugo Benitez Bosques on 8/23/19.
//  Copyright © 2019 Victor Hugo Benitez Bosques. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BDMBottomAlertHandler {
  internal var bottomAlert: BDMBottomAlert?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  
  @IBAction private func btnAction(){
    presentBottomAlert(message: "Hello World", canBeClosed: true, animated: true)
    
  }
  
  @IBAction private func btnCloe(){
    dismissBottomAlert(animated: true)
  }
}

