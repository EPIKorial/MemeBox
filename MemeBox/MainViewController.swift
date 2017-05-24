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
    let memeDB = MemeDatabase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MemeCollection.delegate = self
        MemeCollection.dataSource = self
        self.title = "MemeBox";
        
        let rect = UIView(frame: CGRect(x: -10, y: 0, width: 500, height: 35))
        rect.backgroundColor = UIColor.gray
        rect.alpha = 0.5
        MemeCollection.addSubview(rect)
        
        let titleLabel = UILabel(frame: CGRect(x:10 , y: 5, width: 100 , height: 25))
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 1
        titleLabel.text = "MemeBeats"
        titleLabel.textColor = UIColor.white
        MemeCollection.addSubview(titleLabel);
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
        return memeDB.memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemeCell
        
        cell.backgroundColor = UIColor.black
        cell.img.image = memeDB.memes[indexPath.row].img;
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        playSound(path: memeDB.memes[indexPath.row].sound_path);
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

