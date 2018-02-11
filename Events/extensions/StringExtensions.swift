//
//  StringExtensions.swift
//  Events
//
//  Created by Michael Zhukov on 05/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import Foundation

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            Logger.log("error:", error)
            return  nil
        }
    }

    var fromHtml: String {
        return html2AttributedString?.string ?? ""
    }
}

extension String {
    var fromHtml: String {
        return Data(utf8).fromHtml
    }
}
