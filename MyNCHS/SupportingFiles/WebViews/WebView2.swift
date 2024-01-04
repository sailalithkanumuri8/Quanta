//
//  WebView2.swift
//  Quanta
//
//  Created by SaiLalith Kanumuri on 12/31/23.
//

import SwiftUI
import WebKit

// The second webview to directly launch gmail in our app
struct WebView2: UIViewRepresentable {
    
    let webView: WKWebView
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
}

// WebViewModel object that displays gmail.
class WebViewModel: ObservableObject {
    
    let webView: WKWebView
    let url: URL
 
    init() {
        webView = WKWebView(frame: .zero)
        url = URL(string: "https://mail.google.com/mail/u/0/#inbox")!
        loadUrl()
    }
    
    // Displays gmail
    func loadUrl() {
        webView.load(URLRequest(url: url))
    }
}
