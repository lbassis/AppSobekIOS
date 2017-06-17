//
//  ViewController.swift
//  sobek
//
//  Created by Lucas Barros de Assis on 3/28/17.
//  Copyright © 2017 Lucas Barros de Assis. All rights reserved.
//

// icone da engrenagem: http://www.flaticon.com/free-icon/settings-cog_17214
// icone da impressora: http://www.flaticon.com/free-icon/printer_12022#term=print&page=1&position=4
// icone medico (!): http://www.flaticon.com/free-icon/medical-shape_31996
// infos: http://www.flaticon.com/free-icon/information-button_1176#term=info&page=1&position=9


import UIKit
import WebKit
import ExpandingMenu

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    
	@IBOutlet weak var mWebView: WKWebView!
	var id: String = ""
	var language = 0
    var printMode = 0
    var fullGraph = 0
    
    let touch = "item touched"
    
    let menuButton = ExpandingMenuButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 32.0, height: 32.0)), centerImage: UIImage(named: "optionsIcon")!, centerHighlightedImage: UIImage(named: "optionsIcon")!)
    
    let fullGraphButton = ExpandingMenuItem(size: CGSize(width: 32.0, height: 32.0), title: "Show full graph", image: UIImage(named: "graphIcon")!, highlightedImage: UIImage(named: "graphIcon")!, backgroundImage: UIImage(named: "graphIcon"), backgroundHighlightedImage: UIImage(named: "graphIcon")) { () -> Void in }
    
    let printModeButton = ExpandingMenuItem(size: CGSize(width: 32.0, height: 32.0), title: "Print version", image: UIImage(named: "printIcon")!, highlightedImage: UIImage(named: "printIcon")!, backgroundImage: UIImage(named: "printIcon"), backgroundHighlightedImage: UIImage(named: "printIcon")) { () -> Void in }

    
    func menuButtonSetup() {
        menuButton.center = CGPoint(x: self.view.bounds.width - 32.0, y: self.view.bounds.height - 72.0)
        view.addSubview(menuButton)
        fullGraphButton.titleColor = UIColor.black
        printModeButton.titleColor = UIColor.black
        
        if (language == 0) {
            fullGraphButton.title = "Mostrar grafo completo"
            printModeButton.title = "Versão de impressão"
        }
        
        menuButton.addMenuItems([fullGraphButton, printModeButton])
    }
    
    func itemTouched(_ notification: NSNotification) {
        
        let index = notification.userInfo?["index"] as! Int
        
        switch index {
        
        case 0:
        
            if (self.fullGraph == 0) {
                self.mWebView.evaluateJavaScript("showAllNodes();")
                self.fullGraph = 1
                
                if (self.language == 0) {
                    fullGraphButton.title = "Mostrar principais componentes"
                }
                
                else {
                    fullGraphButton.title = "Show main components"
                }
            }
            
            else {
                self.mWebView.evaluateJavaScript("hideOtherNodes();")
                self.fullGraph = 0
                
                if (self.language == 0) {
                    fullGraphButton.title = "Mostrar grafo completo"
                }
                
                else {
                    fullGraphButton.title = "Show full graph"
                }
            }
            
        case 1:
            
            if (self.printMode == 0) {
                self.mWebView.evaluateJavaScript("printVersion();")
                self.printMode = 1
                
                if (self.language == 0) {
                    printModeButton.title = "Versão padrão"
                }
                    
                else {
                    printModeButton.title = "Regular version"
                }
            }
                
            else {
                self.mWebView.evaluateJavaScript("normalVersion();")
                self.printMode = 0
                
                if (self.language == 0) {
                    printModeButton.title = "Versão de impressão"
                }
                    
                else {
                    printModeButton.title = "Print version"
                }
            }
            
        default:
            print("a")
        }
        
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        menuButtonSetup()
        NotificationCenter.default.addObserver(self, selector: #selector(self.itemTouched(_:)), name: NSNotification.Name(rawValue: touch), object: nil)
        
	
		//let url = URL(string: "http://192.168.25.210/sobek/grafo?=" + String(self.id))// + "=en")
		//let url = URL(string:"http://sobek.ufrgs.br/app/grafo/grafos/?id=" + id)
        let url = URL(string:"http://192.168.25.107/~Lucas/Sobek/grafo/?id=" + id)
		let requestObj = NSURLRequest(url: url!);
		mWebView.load(requestObj as URLRequest);
        
        
        //self.navigationItem.rightBarButtonItem?.title = "fadfsfds"

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}

