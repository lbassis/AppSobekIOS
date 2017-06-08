//
//  InitialViewController.swift
//  sobek
//
//  Created by Lucas Barros de Assis on 4/3/17.
//  Copyright © 2017 Lucas Barros de Assis. All rights reserved.
//

import UIKit
import Alamofire

class InitialViewController: UIViewController {
	
	@IBOutlet weak var aboutView: UIView!
	@IBOutlet weak var navBar: UINavigationItem!
	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var confirmButton: UIButton!
	@IBOutlet weak var aboutBar: UIBarButtonItem!
	@IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
	
	let IDSIZE = 8
	var language = 0	// padrao é portugues
	
	@IBAction func aboutButton(sender: UIBarButtonItem) {
		self.aboutView.isHidden = false
	}
	
	@IBAction func aboutOk(sender: UIButton) {
		self.aboutView.isHidden = true
	}
	
	@IBAction func ptLang(_ sender: Any) {
		self.language = 0
		updateLanguage()
	}
	
	@IBAction func enLang(_ sender: Any) {
		self.language = 1
		updateLanguage()
	}
	
	func updateLanguage() {
		
		if (self.language == 0) {
			self.confirmButton.setTitle("Extrair", for: .normal)
			self.textField.placeholder = "Insira a URL desejada"
			self.aboutBar.title = "Sobre"
		}
		
		else {
			self.confirmButton.setTitle("Extract", for: .normal)
			self.textField.placeholder = "Insert the desired URL"
			self.aboutBar.title = "About"
		}
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
		
		
		//let serverUrl = "http://192.168.25.210/sobek/receiver.php"
		//let serverUrl = "http://192.168.0.78/sobek_request_receiver/receiver.php"
        let serverUrl = "http://192.168.25.107/~Lucas/Sobek/receiver.php"

		let id = randomID()
		let url = textField.text
        		
		let postString: [String:String] = ["TODO":"true", "ADJ":"true", "TOHAVE":"true", "VERBS":"true", "ADV":"true", "NOUNS":"true", "AVGCON":"", "INTER":"true", "LANG":"2", "PRON":"true", "MOB_ID":id, "URL":url!, "TOBE":"true", "FREQ":"", "THES":"false"]
		
		Alamofire.request(serverUrl, method: .post, parameters: postString).responseString { response in
			
			let result = ["id":id, "language":self.language] as [String : Any]
            print (response.description)
			
			self.performSegue(withIdentifier: "segue", sender: result)
			
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
		
		let result = sender as! [String : Any]
		webview.id = result["id"] as! String
		webview.language = result["language"] as! Int
	}
	
}
