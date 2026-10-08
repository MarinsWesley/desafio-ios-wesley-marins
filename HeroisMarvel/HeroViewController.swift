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

        guard let hero = hero1 else {
            return
        }

        title = hero.name

        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self

        let searchText = hero.name.addingPercentEncoding(
            withAllowedCharacters: .urlQueryAllowed
        ) ?? hero.name

        let urlString = "https://en.wikipedia.org/wiki/Special:Search?search=\(searchText)"

        guard let url = URL(string: urlString) else {
            return
        }

        let request = URLRequest(url: url)

        loading.startAnimating()
        webView.load(request)
    }

    func getCharacterID() -> String {
        return hero1.id
    }
}

extension HeroViewController: WKNavigationDelegate {

    func webView(
        _ webView: WKWebView,
        didFinish navigation: WKNavigation!
    ) {
        loading.stopAnimating()
    }

    func webView(
        _ webView: WKWebView,
        didFail navigation: WKNavigation!,
        withError error: Error
    ) {
        loading.stopAnimating()
    }
}
