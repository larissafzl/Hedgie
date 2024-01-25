//
//  File.swift
//  
//
//  Created by Larissa Fazolin on 25/01/24.
//

import Foundation
import SwiftUI

struct FontManager {
    static func loadFont(fontName: String, fontSize: CGFloat) -> Font {
        guard let cfURL = Bundle.main.url(forResource: fontName, withExtension: "ttf") as CFURL? else {
            fatalError("Font file not found for \(fontName)")
        }
        
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        let uiFont = UIFont(name: fontName, size: fontSize)
        return Font(uiFont ?? UIFont())
    }
    
    func buildText(for textParts: [(text: String, fontName: String, fontSize: CGFloat)]) -> Text {
        var result: Text = Text("")
        for part in textParts {
            result = result + Text(part.text)
                .font(FontManager.loadFont(fontName: part.fontName, fontSize: part.fontSize))
        }
        return result
    }
    
}
