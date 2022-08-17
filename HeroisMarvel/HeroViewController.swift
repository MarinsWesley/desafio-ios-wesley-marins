//
//  HeroViewController.swift
//  HeroisMarvel
//
//  Created by MacbookAirWesley on 01/08/22.
//  Copyright © 2022 Eric Brito. All rights reserved.
//

import UIKit
import WebKit

class HeroViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
	var hero1: Hero!
    override func viewDidLoad() {
        super.viewDidLoad()
		let url = URL(string: hero1.urls.first!.url)
		let request = URLRequest(url: url!)
		title = hero1.name
		
		
		webView.allowsBackForwardNavigationGestures = true
		webView.navigationDelegate = self
		webView.load(request)
		
    }
	
	func getCharacterID () -> String {
		let characterID = hero1.id
		return String(characterID)
	}
}

extension HeroViewController: WKNavigationDelegate {
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		loading.stopAnimating()
	}
}


