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
	var id = 66666666
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		self.id = sender as! Int
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		let url = URL(string: "http://192.168.25.104/sobek/grafo/?id=73168828=en")// + String(id) + "=en")
		//let url = URL(string: "http://inf.ufrgs.br/~lbassis?=sobek")
		let requestObj = NSURLRequest(url: url!);
		mWebView.loadRequest(requestObj as URLRequest);
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

