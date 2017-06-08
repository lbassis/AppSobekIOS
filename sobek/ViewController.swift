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

class ViewController: UIViewController {

	
	
	@IBOutlet weak var optionsView: UIView!
	
	@IBOutlet weak var optionsButton: UIBarButtonItem!
	@IBOutlet weak var mWebView: UIWebView!
	var id: String = ""
	var language = 0
    var printMode = 0
    var fullGraph = 0
    
    
    let menuButton1 = ExpandingMenuButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 32.0, height: 32.0)), centerImage: UIImage(named: "optionsIcon")!, centerHighlightedImage: UIImage(named: "optionsIcon")!)
    
    let menuButton2 = ExpandingMenuButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 32.0, height: 32.0)), centerImage: UIImage(named: "optionsIcon")!, centerHighlightedImage: UIImage(named: "optionsIcon")!)

    let menuButton3 = ExpandingMenuButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 32.0, height: 32.0)), centerImage: UIImage(named: "optionsIcon")!, centerHighlightedImage: UIImage(named: "optionsIcon")!)

    let menuButton4 = ExpandingMenuButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 32.0, height: 32.0)), centerImage: UIImage(named: "optionsIcon")!, centerHighlightedImage: UIImage(named: "optionsIcon")!)

    
    let fullGraphButton = ExpandingMenuItem(size: CGSize(width: 32.0, height: 32.0), title: "Show full graph", image: UIImage(named: "graphIcon")!, highlightedImage: UIImage(named: "graphIcon")!, backgroundImage: UIImage(named: "graphIcon"), backgroundHighlightedImage: UIImage(named: "graphIcon")) { () -> Void in
        
        ViewController.updateMenuButton()
        
    }
    let printModeButton = ExpandingMenuItem(size: CGSize(width: 32.0, height: 32.0), title: "Print mode", image: UIImage(named: "printIcon")!, highlightedImage: UIImage(named: "printIcon")!, backgroundImage: UIImage(named: "printIcon"), backgroundHighlightedImage: UIImage(named: "printIcon")) { () -> Void in
        // Do some action
    }
    let subGraphButton = ExpandingMenuItem(size: CGSize(width: 32.0, height: 32.0), title: "Show main components", image: UIImage(named: "graphIcon")!, highlightedImage: UIImage(named: "graphIcon")!, backgroundImage: UIImage(named: "graphIcon"), backgroundHighlightedImage: UIImage(named: "graphIcon")) { () -> Void in
        // Do some action
    }
    let normalModeButton = ExpandingMenuItem(size: CGSize(width: 32.0, height: 32.0), title: "Regular mode", image: UIImage(named: "printIcon")!, highlightedImage: UIImage(named: "printIcon")!, backgroundImage: UIImage(named: "printIcon"), backgroundHighlightedImage: UIImage(named: "printIcon")) { () -> Void in
        // Do some action
    }

    static func updateMenuButton() {
        
      /*  if (printMode == 0 && fullGraph == 0) {
            menuButton1.isHidden = false
            menuButton2.isHidden = true
            menuButton3.isHidden = true
            menuButton3.isHidden = true
        }*/
    }
    
    func menuButtonSetup() {
        
        menuButton1.center = CGPoint(x: self.view.bounds.width - 32.0, y: self.view.bounds.height - 72.0)
        view.addSubview(menuButton1)
        menuButton2.center = CGPoint(x: self.view.bounds.width - 32.0, y: self.view.bounds.height - 72.0)
        view.addSubview(menuButton2)
        menuButton3.center = CGPoint(x: self.view.bounds.width - 32.0, y: self.view.bounds.height - 72.0)
        view.addSubview(menuButton3)
        menuButton4.center = CGPoint(x: self.view.bounds.width - 32.0, y: self.view.bounds.height - 72.0)
        view.addSubview(menuButton4)

        fullGraphButton.titleColor = UIColor.black
        printModeButton.titleColor = UIColor.black
        subGraphButton.titleColor = UIColor.black
        normalModeButton.titleColor = UIColor.black


        
        if (language == 0) {
            fullGraphButton.title = "Mostrar grafo completo"
            printModeButton.title = "Modo de impressão"
            subGraphButton.title = "Mostrar principais componentes"
            normalModeButton.title = "Modo regular"
        }
        
        menuButton1.addMenuItems([fullGraphButton, printModeButton])
        menuButton2.addMenuItems([subGraphButton, printModeButton])
        menuButton3.addMenuItems([fullGraphButton, normalModeButton])
        menuButton4.addMenuItems([subGraphButton, normalModeButton])

        
     /*   menuButton1.willPresentMenuItems = { (menu) -> Void in
            self.updateMenuButton()
        }
        menuButton2.willPresentMenuItems = { (menu) -> Void in
            self.updateMenuButton()
        }
        menuButton3.willPresentMenuItems = { (menu) -> Void in
            self.updateMenuButton()
        }
        menuButton4.willPresentMenuItems = { (menu) -> Void in
            self.updateMenuButton()
        }

        */
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        menuButtonSetup()
        
        
        
		
	
		//let url = URL(string: "http://192.168.25.210/sobek/grafo?=" + String(self.id))// + "=en")
		//let url = URL(string:"http://sobek.ufrgs.br/app/grafo/grafos/?id=" + id)
        let url = URL(string:"http://192.168.25.107/~Lucas/Sobek/grafo/?id=" + id)
        print (url)
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

