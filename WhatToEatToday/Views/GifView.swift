//
//  AnimatedImageView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 29/07/2022.
//
//https://github.com/pitt500/GifView-SwiftUI/blob/main/GifView_SwiftUI/GifView_SwiftUI/GifImage.swift

import SwiftUI
import WebKit

struct GifView: UIViewRepresentable {
    let name: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.isOpaque = false
        webView.backgroundColor = UIColor.clear
        webView.scrollView.backgroundColor = UIColor.clear
        // create url object
        let url = Bundle.main.url(forResource: name, withExtension: "gif")
        do {
            // create data object
            let data = try Data(contentsOf: url!)
            // load gif view
            webView.load(
                data,
                mimeType: "image/gif",
                characterEncodingName: "UTF-8",
                baseURL: url!.deletingLastPathComponent()
            )
            // disable scroll view
            webView.scrollView.isScrollEnabled = false
        }
        catch {
            print("Could not parse gif image")
        }

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
}

struct AnimatedImageView_Previews: PreviewProvider {
    static var previews: some View {
        GifView(name: "cat-eat")
    }
}
