//
//  File.swift
//  
//
//  Created by Larissa Fazolin on 25/01/24.
//

import Foundation

struct ContentIntroView1 {
    let imageName: String
    let textContent: [(text: String, fontName: String)]
}

let content: [ContentIntroView1] = [
    ContentIntroView1(imageName: "smily hedge", textContent: [
        ("Meet", "VarelaRound-Regular"),
        (" Hedgie, the socially anxious hedgehog", "LoveYaLikeASister-Regular"),
        ("!", "VarelaRound-Regular")
    ]),
    
    ContentIntroView1(imageName: "hedge", textContent: [
        ("As his name already says, ", "VarelaRound-Regular"),
        ("Hedgie", "LoveYaLikeASister-Regular"),
        (" was diagnosed with social anxiety.", "VarelaRound-Regular")
    ]),
    
    ContentIntroView1(imageName: "sad hedge", textContent: [
        ("This, unfortunately, means that even the most casual socialization can feel like a tough ", "VarelaRound-Regular"),
        ("battle ", "LoveYaLikeASister-Regular"),
        ("to him.", "VarelaRound-Regular")
    ]),
    
    ContentIntroView1(imageName: "hedge", textContent: [
        ("However, it's... Oops, I'm sorry, it seems like someone is coming.", "VarelaRound-Regular")
    ]),
    
    ContentIntroView1(imageName: "hi otter", textContent: [
        ("Otty, the friendly friend", "LoveYaLikeASister-Regular"),
        (" has appeared!", "VarelaRound-Regular")
    ])
]
