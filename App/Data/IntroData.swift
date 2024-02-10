//
//  ContentIntroView1.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import Foundation

// MARK: - IntroContent Struct

struct IntroContent {
    struct TextPart {
        let text: String
        let fontName: String
        let isItalic: Bool
    }
    
    let imageName: String
    let textContent: [TextPart]
}

// MARK: - Content Array

let content: [IntroContent] = [
    IntroContent(imageName: "happyHedge", textContent: [
        IntroContent.TextPart(text: "This is the story of", fontName: "GillSans", isItalic: false),
        IntroContent.TextPart(text: " Hedgie, the socially anxious hedgehog", fontName: "GillSans-Italic", isItalic: true),
        IntroContent.TextPart(text: "!", fontName: "GillSans", isItalic: false)
    ]),
    
    IntroContent(imageName: "shockedHedge", textContent: [
        IntroContent.TextPart(text: "Say hi to the player, ", fontName: "GillSans", isItalic: false),
        IntroContent.TextPart(text: " Hedgie", fontName: "GillSans-Italic", isItalic: true),
        IntroContent.TextPart(text: "!", fontName: "GillSans", isItalic: false)
    ]),
    
    IntroContent(imageName: "shockedHedge", textContent: [
        IntroContent.TextPart(text: "Sorry, buddy.  As I said, ", fontName: "GillSans", isItalic: false),
        IntroContent.TextPart(text: "Hedgie ", fontName: "GillSans-Italic", isItalic: true),
        IntroContent.TextPart(text: "was diagnosed with social anxiety.", fontName: "GillSans", isItalic: false)
    ]),
    
    IntroContent(imageName: "sadHedge", textContent: [
        IntroContent.TextPart(text: "This, unfortunately, means that even the most casual socializations can feel like a tough ", fontName: "GillSans", isItalic: false),
        IntroContent.TextPart(text: "battle ", fontName: "GillSans-Italic", isItalic: true),
        IntroContent.TextPart(text: "to him.", fontName: "GillSans", isItalic: false)
    ]),
    
    IntroContent(imageName: "hedge", textContent: [
        IntroContent.TextPart(text: "Hedgie ", fontName: "GillSans-Italic", isItalic: true),
        IntroContent.TextPart(text: "knows he's not alone in this, but... Oops, it seems like someone is coming.", fontName: "GillSans", isItalic: false)
    ])
//    
//    IntroContent(imageName: "hiOtter", textContent: [
//        IntroContent.TextPart(text: "Otty, the friendly friend", fontName: "GillSans-Italic", isItalic: true),
//        IntroContent.TextPart(text: " has appeared!", fontName: "GillSans", isItalic: false)
//    ])
]
