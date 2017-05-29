//
//  MemeDatabase.swift
//  MemeBox
//
//  Created by Florian on 24/05/2017.
//  Copyright © 2017 florianhuet. All rights reserved.
//

import Foundation

class AmbiantMemeDatabase {
    
    var memes = [Meme]()
    
    init() {
        memes.append(Meme(path: "planetes", Img: #imageLiteral(resourceName: "planetes")));
    }
}

class MemeDatabase {
    
    var memes = [Meme]()
    
    init() {
        memes.append(Meme(path: "ah", Img: #imageLiteral(resourceName: "ah!")));
        memes.append(Meme(path: "maisouicestclair", Img: #imageLiteral(resourceName: "maisouicestclair")));
        memes.append(Meme(path: "souffrirok", Img: #imageLiteral(resourceName: "souffrir")));
        memes.append(Meme(path: "allusion", Img: #imageLiteral(resourceName: "allusion")));
        memes.append(Meme(path: "popopo", Img: #imageLiteral(resourceName: "popopo")));
        memes.append(Meme(path: "partout", Img: #imageLiteral(resourceName: "partout")));
        memes.append(Meme(path: "pasfaux", Img: #imageLiteral(resourceName: "pasfaux")));
    }
}
