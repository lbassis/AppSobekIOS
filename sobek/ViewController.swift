//
//  ViewController.swift
//  sobek
//
//  Created by Lucas Barros de Assis on 3/28/17.
//  Copyright © 2017 Lucas Barros de Assis. All rights reserved.
//


import UIKit
import WebKit
import ExpandingMenu

class ViewController: UIViewController, WKUIDelegate, WKScriptMessageHandler {



    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    var mWebView: WKWebView = WKWebView()
	var id: String = ""
	var language = 0
    var printMode = 0
    var fullGraph = 0
    
    let touch = "item touched"
    
    let reloadButton = ExpandingMenuItem(size: CGSize(width: 32.0, height: 32.0), title: "Reload original graph", image: UIImage(named: "reloadIcon")!, highlightedImage: UIImage(named: "reloadIcon")!, backgroundImage: UIImage(named: "reloadIcon"), backgroundHighlightedImage: UIImage(named: "reloadIcon")) { () -> Void in }
    
    let menuButton = ExpandingMenuButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 32.0, height: 32.0)), centerImage: UIImage(named: "optionsIcon")!, centerHighlightedImage: UIImage(named: "optionsIcon")!)
    
    let fullGraphButton = ExpandingMenuItem(size: CGSize(width: 32.0, height: 32.0), title: "Show full graph", image: UIImage(named: "graphIcon")!, highlightedImage: UIImage(named: "graphIcon")!, backgroundImage: UIImage(named: "graphIcon"), backgroundHighlightedImage: UIImage(named: "graphIcon")) { () -> Void in }
    
    let printModeButton = ExpandingMenuItem(size: CGSize(width: 32.0, height: 32.0), title: "Print version", image: UIImage(named: "printIcon")!, highlightedImage: UIImage(named: "printIcon")!, backgroundImage: UIImage(named: "printIcon"), backgroundHighlightedImage: UIImage(named: "printIcon")) { () -> Void in }
    
    
    @IBAction func confirmButtonPressed(_ sender: Any) {
        self.mWebView.evaluateJavaScript("confirm();")
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.mWebView.evaluateJavaScript("cancel();")
    }

    
    func menuButtonSetup() {
        menuButton.center = CGPoint(x: self.view.bounds.width - 32.0, y: self.view.bounds.height - 72.0)
        view.addSubview(menuButton)
        
        reloadButton.titleColor = UIColor.black
        fullGraphButton.titleColor = UIColor.black
        printModeButton.titleColor = UIColor.black
        
        if (language == 0) {
            reloadButton.title = "Recarregar grafo original"
            fullGraphButton.title = "Mostrar grafo completo"
            printModeButton.title = "Versão de impressão"
        }
        
        menuButton.addMenuItems([reloadButton, fullGraphButton, printModeButton])
    }
    
    func confirmationButtonSetup() {
        
        if (self.language == 0) {
            confirmButton.setTitle("Confirmar", for: UIControlState.normal)
            cancelButton.setTitle("Cancelar", for: UIControlState.normal)
        }
        
        else {
            confirmButton.setTitle("Confirm", for: UIControlState.normal)
            cancelButton.setTitle("Cancel", for: UIControlState.normal)
        }
    }
    
    func itemTouched(_ notification: NSNotification) {
        
        let index = notification.userInfo?["index"] as! Int
        
        switch index {
        
        case 0:
            
            self.mWebView.evaluateJavaScript("confirmReload();")
            self.fullGraph = 0
            self.printMode = 0
            
            if (self.language == 0) {
                fullGraphButton.title = "Mostrar grafo completo"
                printModeButton.title = "Versão de impressão"
            }
            
            else {
                fullGraphButton.title = "Show full graph"
                printModeButton.title = "Print Version"

            }
            
            
        case 1:
        
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
                self.mWebView.evaluateJavaScript("showMainComponents();")
                self.fullGraph = 0
                
                if (self.language == 0) {
                    fullGraphButton.title = "Mostrar grafo completo"
                }
                
                else {
                    fullGraphButton.title = "Show full graph"
                }
            }
            
        case 2:
            
            if (self.printMode == 0) {
                self.mWebView.evaluateJavaScript("showPrintVersion();")
                self.printMode = 1
                
                if (self.language == 0) {
                    printModeButton.title = "Versão padrão"
                }
                    
                else {
                    printModeButton.title = "Regular version"
                }
            }
                
            else {
                self.mWebView.evaluateJavaScript("showNormalVersion();")
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
        
        let contentController = WKUserContentController()
        contentController.add(self, name: "callbackHandler")
        let config = WKWebViewConfiguration()
        config.userContentController = contentController

        
        self.mWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: self.view.frame.height - (self.navigationController?.navigationBar.frame.height)!), configuration: config)
        view.addSubview(mWebView)

        self.mWebView.uiDelegate = self
        
        confirmationButtonSetup()
        menuButtonSetup()
        NotificationCenter.default.addObserver(self, selector: #selector(self.itemTouched(_:)), name: NSNotification.Name(rawValue: touch), object: nil)
        
        
        var languageString = ""
        
        if (language == 0) {
            languageString = "pt"
        }
        else {
            languageString = "en"
        }
        
        
        let url = URL(string:"http://sobek.ufrgs.br/app/grafo/?id=" + id + "=" + languageString)
        //let url = URL(string:"http://192.168.25.107/~Lucas/Sobek/grafo/?id=" + id + "=" + languageString)
		let requestObj = NSURLRequest(url: url!);
		mWebView.load(requestObj as URLRequest);
        
        
        mWebView.evaluateJavaScript("cy.fit(cy.nodes('node'));")
    }

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
    
    
    
    
    
    ///////////////////////
    // interface com o js
    ///////////////////////
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("\(message.body as! String)")
        
        if (message.body as! String == "show") {
            self.view.bringSubview(toFront: self.confirmButton)
            self.view.bringSubview(toFront: self.cancelButton)
            self.menuButton.isHidden = true
        }
        
        else if (message.body as! String == "hide") {
            print("chegou um hide")
            self.view.sendSubview(toBack: self.confirmButton)
            self.view.sendSubview(toBack: self.cancelButton)
            self.menuButton.isHidden = false
        }
        
        else {
            self.mWebView.reload()
        }
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertControllerStyle.alert)
        self.present(alert, animated: true, completion: nil)
        completionHandler();
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler:{ action in
            completionHandler(false)
        }))
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler:{ action in
            completionHandler(true)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        
        let alertController = UIAlertController(title: frame.request.url?.host, message: prompt, preferredStyle: .alert)
        weak var alertTextField: UITextField!
        alertController.addTextField { textField in
            textField.text = defaultText
            alertTextField = textField
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            completionHandler(nil)
        }))
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            completionHandler(alertTextField.text)
        }))
        present(alertController, animated: true, completion: nil)

    }
}

