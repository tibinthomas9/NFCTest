//
//  ViewController.swift
//  NFCTest
//
//  Created by Tibin Thomas on 23/04/18.
//  Copyright © 2018 tibin. All rights reserved.
//

import UIKit
import CoreNFC
class ViewController: UIViewController,NFCNDEFReaderSessionDelegate {
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        var result = ""
        for payload in messages[0].records {
            result += String.init(data: payload.payload.advanced(by: 3), encoding: .utf8)! 
        }
        print("message", result)

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        startNFCSession()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func startNFCSession() {
        
        if #available(iOS 11.0, *) {
            let scannerSession = NFCNDEFReaderSession(delegate: self,
                                                      queue:nil,
                                                      invalidateAfterFirstRead:true)
            scannerSession.begin()
        } else {
        }
        
    }

}

