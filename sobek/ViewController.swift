//
//  ViewController.swift
//  sobek
//
//  Created by Lucas Barros de Assis on 3/28/17.
//  Copyright © 2017 Lucas Barros de Assis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var mWebView: UIWebView!
	var id: String = ""
	

	
	override func viewDidLoad() {
		super.viewDidLoad()
		let url = URL(string: "http://192.168.25.104/sobek/grafo?=" + String(self.id))// + "=en")
		print (url)
		let requestObj = NSURLRequest(url: url!);
		mWebView.loadRequest(requestObj as URLRequest);
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

