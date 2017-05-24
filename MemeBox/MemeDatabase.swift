//
//  MemeDatabase.swift
//  MemeBox
//
//  Created by Florian on 24/05/2017.
//  Copyright © 2017 florianhuet. All rights reserved.
//

import Foundation

class MemeDatabase {
    
    var memes = [Meme]()
    
    init() {
        memes.append(Meme(path: "ah", Img: #imageLiteral(resourceName: "ah!")));
        memes.append(Meme(path: "maisouicestclair", Img: #imageLiteral(resourceName: "maisouicestclair")));
        memes.append(Meme(path: "souffrirok", Img: #imageLiteral(resourceName: "souffrir")));
        memes.append(Meme(path: "allusion", Img: #imageLiteral(resourceName: "allusion")));
    }
}
