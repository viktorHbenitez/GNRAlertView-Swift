//
//  ViewController.swift
//  GNRAlertView
//
//  Created by Victor Hugo Benitez Bosques on 8/23/19.
//  Copyright © 2019 Victor Hugo Benitez Bosques. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GNRBottonXIBHandler {
  var gnrView: GNRBottonXIB?
  
  
  let strParameters = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presentAlert(strParameters, with: true)
  }
  
  @IBAction func tappedButton(){
    presentAlert(strParameters, with: true)
  }


}

