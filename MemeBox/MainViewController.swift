//
//  ViewController.swift
//  MemeBox
//
//  Created by Florian Huet on 23/05/2017.
//  Copyright © 2017 florianhuet. All rights reserved.
//

import UIKit
import AVFoundation

class MemeCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
}

class Meme {
    var sound_path = String()
    var img = UIImage()
    
    init(path: String, Img: UIImage) {
        sound_path = path;
        img = Img;
    }
}

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var MemeCollection: UICollectionView!
    var player: AVAudioPlayer?
    let reuseIdentifier = "MemeCellID"
    var memes = [Meme]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MemeCollection.delegate = self
        MemeCollection.dataSource = self
        self.title = "MemeBox";
        
        memes.append(Meme(path: "ah", Img: #imageLiteral(resourceName: "ah!")));
        memes.append(Meme(path: "maisouicestclair", Img: #imageLiteral(resourceName: "maisouicestclair")));
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemeCell
        
        cell.backgroundColor = UIColor.black
        cell.img.image = memes[indexPath.row].img;
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        playSound(path: memes[indexPath.row].sound_path);
    }
    
    func playSound(path: String) {
        guard let url = Bundle.main.url(forResource: path, withExtension: "mp3") else {
            print("error")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

