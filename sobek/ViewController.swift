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


import UIKit
import AZDropdownMenu
import ExpandingMenu

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    

    
	@IBOutlet weak var optionsView: UIView!
	
	@IBOutlet weak var optionsButton: UIBarButtonItem!
	@IBOutlet weak var mWebView: UIWebView!
	var id: String = ""
	var language = 0
    var printMode = 0 {
        willSet(newMode) {
            
            if (newMode) == 0 {
                printModeButton.title = "Regular mode"
            }
            
            
        }
    }
    var fullGraph = 0
    
    let touch = "item touched"
    
    let menuButton = ExpandingMenuButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 32.0, height: 32.0)), centerImage: UIImage(named: "optionsIcon")!, centerHighlightedImage: UIImage(named: "optionsIcon")!)
    
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapBlurButton(_:)))
    
    let fullGraphButton = ExpandingMenuItem(size: CGSize(width: 32.0, height: 32.0), title: "Show full graph", image: UIImage(named: "graphIcon")!, highlightedImage: UIImage(named: "graphIcon")!, backgroundImage: UIImage(named: "graphIcon"), backgroundHighlightedImage: UIImage(named: "graphIcon")) { () -> Void in
        // Do some action
    }
    let printModeButton = ExpandingMenuItem(size: CGSize(width: 32.0, height: 32.0), title: "Print mode", image: UIImage(named: "printIcon")!, highlightedImage: UIImage(named: "printIcon")!, backgroundImage: UIImage(named: "printIcon"), backgroundHighlightedImage: UIImage(named: "printIcon")) { () -> Void in
        // Do some action
    }

    
    
    func tapBlurButton(_ sender: UITapGestureRecognizer) {
        print("entrou aqui pelo menos")
        print(self.mWebView.stringByEvaluatingJavaScript(from: "getPrintMode();")!.description)
    }

    
    func menuButtonSetup() {
        
        menuButton.center = CGPoint(x: self.view.bounds.width - 32.0, y: self.view.bounds.height - 72.0)
        view.addSubview(menuButton)
        fullGraphButton.titleColor = UIColor.black
        printModeButton.titleColor = UIColor.black


        
        if (language == 0) {
            fullGraphButton.title = "Mostrar grafo completo"
            printModeButton.title = "Modo de impressão"
        }
        
        menuButton.addMenuItems([fullGraphButton, printModeButton])
    }
    
    func itemTouched() {
        print("ALELUIA")
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: "itemTouched", name: NSNotification.Name(rawValue: touch), object: nil)

        
        menuButtonSetup()
        
        
        self.menuButton.addGestureRecognizer(tapGesture)
		
	
		//let url = URL(string: "http://192.168.25.210/sobek/grafo?=" + String(self.id))// + "=en")
		//let url = URL(string:"http://sobek.ufrgs.br/app/grafo/grafos/?id=" + id)
        let url = URL(string:"http://192.168.25.107/~Lucas/Sobek/grafo/?id=" + id)
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

