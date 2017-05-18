//
//  InitialViewController.swift
//  sobek
//
//  Created by Lucas Barros de Assis on 4/3/17.
//  Copyright © 2017 Lucas Barros de Assis. All rights reserved.
//

import UIKit
import Alamofire
import BTNavigationDropdownMenu

class InitialViewController: UIViewController {
	
	@IBOutlet weak var aboutView: UIView!
	@IBOutlet weak var navBar: UINavigationItem!
	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var confirmButton: UIButton!
	@IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
	
	let IDSIZE = 8
	
	@IBAction func aboutButton(sender: UIBarButtonItem) {
		self.aboutView.isHidden = false
	}
	
	@IBAction func aboutOk(sender: UIButton) {
		self.aboutView.isHidden = true
	}
	
	
	func hideNavBar() {
		self.navigationController?.navigationBar.isTranslucent = false
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
	}
	
	@IBAction func sendRequest(_ sender: UIButton) {
		
		self.loadingIndicator.isHidden = false
		self.view.isUserInteractionEnabled = false
		self.view.alpha = 0.85
		self.navigationController?.navigationBar.alpha = 0.85
		
		
		let serverUrl = "http://192.168.25.210/sobek/receiver.php"
		//let serverUrl = "http://192.168.0.78/sobek_request_receiver/receiver.php"

		let id = randomID()
		let url = textField.text
		
		let postString: [String:String] = ["TODO":"true", "ADJ":"true", "TOHAVE":"true", "VERBS":"true", "ADV":"true", "NOUNS":"true", "AVGCON":"", "INTER":"true", "LANG":"2", "PRON":"true", "MOB_ID":id, "URL":url!, "TOBE":"true", "FREQ":"", "THES":"false"]
		
		Alamofire.request(serverUrl, method: .post, parameters: postString).responseString { response in
			self.performSegue(withIdentifier: "segue", sender: id)
			self.loadingIndicator.isHidden = true
			self.navigationController?.navigationBar.alpha = 1
			self.view.isUserInteractionEnabled = true
		}

		

		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		hideNavBar()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func randomID() -> String {
		
		var i = 0
		var result = ""
		
		while (i < IDSIZE) {
			result = result + String(Int(arc4random_uniform(9) + 1))
			i += 1
		}
		return result
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let webview = segue.destination as! ViewController
		webview.id = sender as! String
	}
	
}
