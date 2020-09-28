//
//  ViewController.swift
//  Example-Swift
//
//  Created by Samed Düzçay on 22/09/2020.
//  Copyright © 2020 Infoset Teknoloji A.S. All rights reserved.
//

import UIKit
import Infoset
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Infoset"
    }
    
    @IBAction func openChat(_ sender: Any) {
        //Presenting chat:
        InfosetChat.presentChat()
    }
    
    @IBAction func clearSession(_ sender: Any) {
        //Clearing session:
        InfosetChat.clearSession()
    }
}

