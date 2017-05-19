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
			if (self.titles[0] == "Mostrar grafo completo") {
				self.mWebView.stringByEvaluatingJavaScript(from: "showAllNodes();")
				self.titles[0] = "Ocultar menores termos"
			}
			else {
				self.mWebView.stringByEvaluatingJavaScript(from: "hideOtherNodes();")
				self.titles[0] = "Mostrar grafo completo"
			}

		case 1:
			if (self.titles[1] == "Modo de impressão") {
				self.mWebView.stringByEvaluatingJavaScript(from: "printVersion();")
				self.titles[1] = "Modo padrão"
			}
			else {
				self.mWebView.stringByEvaluatingJavaScript(from: "normalVersion();")
				self.titles[1] = "Modo de impressão"
			}

		case 2:
			self.mWebView.stringByEvaluatingJavaScript(from: "normalVersion();")
		default:
			print(index)
		}
		
		self.menu = AZDropdownMenu(titles: self.titles)
		self.menu.cellTapHandler = { [weak self] (indexPath: IndexPath) -> Void in
			self?.handleOption(index:indexPath.row)}
	}
	

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.titles = ["Mostrar grafo completo", "Modo de impressão", "Adicionar termo"]
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

