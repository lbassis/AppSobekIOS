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
	
    @IBOutlet weak var aboutBarButton: UIBarButtonItem!
	@IBOutlet weak var aboutView: UIView!
	@IBOutlet weak var navBar: UINavigationItem!
	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var aboutText: UITextView!
    
    
	@IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
	
	let IDSIZE = 8
    var language = 0	// 0 é portugues
	
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
        
        let defaults = UserDefaults.standard
		
		if (self.language == 0) {
			self.confirmButton.setTitle("Extrair", for: .normal)
			self.textField.placeholder = "Insira a URL desejada"
            self.aboutText.text = "Sobek é uma ferramenta de mineração de texto que foi desenvolvida para apoiar aplicações educacionais. Ele é capaz de identificar as informações relevantes em um texto e apresentar essas informações na forma de um grafo, auxiliando a sua identificação visual. O Sobek foi desenvolvido no Programa de Pós-Graduação em Informática na Educação, na Universidade Federal do Rio Grande do Sul (UFRGS), Brasil. Para obter mais informações, visite \nhttp://sobek.ufrgs.br\n\nÍcones fornecidos em http://flaticon.com pelos usuários Freepik, Yannik e Gregor Cresnar"
            
            defaults.set(0, forKey: "language")

		}
		
		else {
			self.confirmButton.setTitle("Extract", for: .normal)
			self.textField.placeholder = "Insert the desired URL"
            self.aboutText.text = "Sobek is a text mining tool developed to assist educational applications. It is able to identify the relevant information in a text and show them as a graph, helping in its visual identification. Sobek was developed at the Programa de Pós-Graduação em Informática na Educação from the Universidade Federal do Rio Grande do Sul (UFRGS), Brazil. For more information, see \nhttp://sobek.ufrgs.br\n\nIcons provided by http://flaticon.com by the users Freepik, Yannik and Gregor Cresnar"
            
            defaults.set(1, forKey: "language")
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
		
		
		let serverUrl = "http://sobek.ufrgs.br/app/receiver.php"
        //let serverUrl = "http://192.168.25.107/~Lucas/Sobek/receiver.php"

		let id = randomID()
		let url = textField.text
        		
		let postString: [String:String] = ["TODO":"true", "ADJ":"true", "TOHAVE":"true", "VERBS":"true", "ADV":"true", "NOUNS":"true", "AVGCON":"", "INTER":"true", "LANG":"2", "PRON":"true", "MOB_ID":id, "URL":url!, "TOBE":"true", "FREQ":"", "THES":"false"]
		
		Alamofire.request(serverUrl, method: .post, parameters: postString).responseString { response in
			
            
            self.loadingIndicator.isHidden = true

            if (response.description == "SUCCESS: INVALID URL" || response.description == "SUCCESS: FAILED EXTRACTING TEXT") {
                
                var message = ""
                
                if (self.language == 0) {
                    message = "Falha ao extrair o texto"
                }
                
                else {
                    message = "Failed extracting text"
                }
                
                let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: {
                    self.view.alpha = 1
                    self.navigationController?.navigationBar.alpha = 1
                    self.view.isUserInteractionEnabled = true
                })
            }
            
            else {
                self.navigationController?.navigationBar.alpha = 1
                let result = ["id":id, "language":self.language] as [String : Any]
                self.performSegue(withIdentifier: "segue", sender: result)
            }
			
		}

		

		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
        let defaults = UserDefaults.standard
        self.language = defaults.integer(forKey: "language")
        updateLanguage()
	}
	
	override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
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
        
        if (language == 0) {
            webview.navigationItem.backBarButtonItem?.title = "Voltar"
        }
        
        else {
            webview.navigationItem.backBarButtonItem?.title = "Back"
        }
	}
	
}
