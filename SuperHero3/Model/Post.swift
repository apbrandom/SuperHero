//
//  Post.swift
//  SuperHero3
//
//  Created by Vadim Vinogradov on 07.08.2023.
//

import SwiftUI

struct Post {
    let title: String
    let discription: String
    let image: Image
    
    func makePosts() -> [Post] {
        [
            Post(title: "FirstTitle", discription: "FirstTitle", image: Image("photo")),
            Post(title: "SecondTitle", discription: "Second Description", image: Image(systemName: "figure.arms.open"))
        ]
    }
}
