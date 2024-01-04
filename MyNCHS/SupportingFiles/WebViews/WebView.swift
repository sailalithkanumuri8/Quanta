//
//  WebView.swift
//  Quanta
//
//  Created by SaiLalith Kanumuri on 12/31/23.
//

import SwiftUI
import WebKit
 
// Opens a website on safari without leaving the app
// User cannot access other websites than the one they clicked, which is a good feature
struct WebView: UIViewRepresentable {
    var url: URL
 
    // Uses WKWebView to make the pop up
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    // Updates the view each time there is a request
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
