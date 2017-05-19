//
//  ViewController.swift
//  sobek
//
//  Created by Lucas Barros de Assis on 3/28/17.
//  Copyright © 2017 Lucas Barros de Assis. All rights reserved.
//

import UIKit
import AZDropdownMenu

class ViewController: UIViewController {

	
	
	@IBOutlet weak var optionsView: UIView!
	
	@IBOutlet weak var optionsButton: UIBarButtonItem!
	@IBOutlet weak var mWebView: UIWebView!
	var id: String = ""
	var language = 0
	var menu = AZDropdownMenu(titles: [])
	var titles = [String]()

	@IBAction func optionPress(_ sender: Any) {
		
		if (self.menu.isDescendant(of: self.view) == true) {
			self.menu.hideMenu()
		} else {
			self.menu.showMenuFromView(self.view)
		}
	}
	
	func handleOption(index: Int) {
		
		switch index {
		case 0:
			if (self.titles[0] == "Mostrar grafo completo" || self.titles[0] == "Show full graph" ) {
				self.mWebView.stringByEvaluatingJavaScript(from: "showAllNodes();")
				
				if (self.language == 0) {
					self.titles[0] = "Ocultar menores termos"
				}
				else {
					self.titles[0] = "Hide lesser terms"
				}
			}
			else {
				self.mWebView.stringByEvaluatingJavaScript(from: "hideOtherNodes();")
				if (self.language == 0) {
					self.titles[0] = "Mostrar grafo completo"
				}
				else {
					self.titles[0] = "Show full graph"
				}
			}
		case 1:
			if (self.titles[1] == "Modo de impressão" || self.titles[1] == "Printing mode") {
				self.mWebView.stringByEvaluatingJavaScript(from: "printVersion();")
				if (self.language == 0) {
					self.titles[1] = "Modo padrão"
				}
				else {
					self.titles[1] = "Default mode"
				}
			}
			else {
				self.mWebView.stringByEvaluatingJavaScript(from: "normalVersion();")
				if (self.language == 0) {
					self.titles[1] = "Modo de impressão"
				}
				else {
					self.titles[1] = "Printing mode"
				}
			}

		case 2:
			self.mWebView.stringByEvaluatingJavaScript(from: "userNewNode();")
		default:
			print(index)
		}
		
		self.menu = AZDropdownMenu(titles: self.titles)
		self.menu.cellTapHandler = { [weak self] (indexPath: IndexPath) -> Void in
			self?.handleOption(index:indexPath.row)}
	}
	

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if (language == 0) {
			self.titles = ["Mostrar grafo completo", "Modo de impressão", "Adicionar termo"]
		}
		else {
			self.titles = ["Show full graph", "Printing mode", "Add term"]
			self.optionsButton.title = "Options"
		}

		self.menu = AZDropdownMenu(titles: titles)
		
		self.menu.cellTapHandler = { [weak self] (indexPath: IndexPath) -> Void in
			self?.handleOption(index:indexPath.row)
		}
	
		let url = URL(string: "http://192.168.25.210/sobek/grafo?=" + String(self.id))// + "=en")
		//let url = URL(string:"http://sobek.ufrgs.br/app/grafo/?id=" + id)
		let requestObj = NSURLRequest(url: url!);
		mWebView.loadRequest(requestObj as URLRequest);

	}



	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	
	//showAllNodes();
	//	hideOtherNodes();


}

