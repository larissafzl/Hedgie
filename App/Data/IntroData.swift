//
//  ContentIntroView1.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import Foundation

// MARK: - ContentIntroView1 Struct

struct ContentIntroView1 {
    struct TextPart {
        let text: String
        let fontName: String
        let isItalic: Bool
    }
    
    let imageName: String
    let textContent: [TextPart]
}

// MARK: - Content Array

let content: [ContentIntroView1] = [
    ContentIntroView1(imageName: "happyHedge", textContent: [
        ContentIntroView1.TextPart(text: "Meet", fontName: "GillSans", isItalic: false),
        ContentIntroView1.TextPart(text: " Hedgie, the socially anxious hedgehog", fontName: "GillSans-Italic", isItalic: true),
        ContentIntroView1.TextPart(text: "!", fontName: "GillSans", isItalic: false)
    ]),
    
    ContentIntroView1(imageName: "hedge", textContent: [
        ContentIntroView1.TextPart(text: "As his name already says, ", fontName: "GillSans", isItalic: false),
        ContentIntroView1.TextPart(text: "Hedgie", fontName: "GillSans-Italic", isItalic: true),
        ContentIntroView1.TextPart(text: " was diagnosed with social anxiety.", fontName: "GillSans", isItalic: false)
    ]),
    
    ContentIntroView1(imageName: "sadHedge", textContent: [
        ContentIntroView1.TextPart(text: "This, unfortunately, means that even the most casual socialization can feel like a tough ", fontName: "GillSans", isItalic: false),
        ContentIntroView1.TextPart(text: "battle ", fontName: "GillSans-Italic", isItalic: true),
        ContentIntroView1.TextPart(text: "to him.", fontName: "GillSans", isItalic: false)
    ]),
    
    ContentIntroView1(imageName: "hedge", textContent: [
        ContentIntroView1.TextPart(text: "However, it's... Oops, I'm sorry, it seems like someone is coming.", fontName: "GillSans", isItalic: false)
    ]),
    
    ContentIntroView1(imageName: "hiOtter", textContent: [
        ContentIntroView1.TextPart(text: "Otty, the friendly friend", fontName: "GillSans-Italic", isItalic: true),
        ContentIntroView1.TextPart(text: " has appeared!", fontName: "GillSans", isItalic: false)
    ])
]
