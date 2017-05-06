//
//  InitialViewController.swift
//  sobek
//
//  Created by Lucas Barros de Assis on 4/3/17.
//  Copyright © 2017 Lucas Barros de Assis. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
	
	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var confirmButton: UIButton!
	
	
	@IBAction func sendRequest(_ sender: UIButton) {
		
		//let serverUrl = "http://sobek.ufrgs.br/app/receiver.php?"
		let serverUrl = "http://192.168.25.104/sobek/receiver.php"
		
		var request = URLRequest(url: URL(string: serverUrl)!)
		let postString = "TOBE=true&ADJ=true&TOHAVE=true&VERBS=true&ADV:true"

		//let postString: [String:String] = ["TODO":"true", "ADJ":"true", "TOHAVE":"true", "VERBS":"true", "ADV":"true", "NOUNS":"true", "AVGCON":"", "INTER":"true", "LANG":"2", "PRON":"true", "MOB_ID":"17356698", "URL":"sobek.ufrgs.br", "TOBE":"true", "FREQ":"", "THES":"false"]
		//let postString = "TODO=true, ADJ=true, TOHAVE=true, VERBS=true, ADV=true, NOUNS=true, AVGCON=, INTER=true, LANG=2, PRON=true, MOB_ID=73168828, URL=ufrgs.br, TOBE=true, FREQ=, THES=false"
		
		request.httpMethod = "POST"
		request.httpBody = postString.data(using: .utf8)!
		
		let task = URLSession.shared.dataTask(with: request) { data, response, error in
			guard let data = data, error == nil else {                                                 // check for fundamental networking error
				print("error=\(error)")
				return
			}
			
			if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
				print("statusCode should be 200, but is \(httpStatus.statusCode)")
				print("response = \(response)")
			}
			
			let responseString = String(data: data, encoding: .utf8)
			print("responseString = \(responseString!)")
			print("data = \(data)")
		}
		task.resume()

		
		self.performSegue(withIdentifier: "segue", sender: 17356698)

		
		//print(self.textField.text!)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()

	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
}
