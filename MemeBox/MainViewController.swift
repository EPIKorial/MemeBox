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
    
   // @IBOutlet weak var AmbiantMemeCollection: UICollectionView!
    
    var player: AVAudioPlayer?
    let reuseIdentifier = "MemeCellID"
    let memeDB = MemeDatabase()
    //let ambiantMemeDB = AmbiantMemeDatabase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MemeCollection.delegate = self
        MemeCollection.dataSource = self
//        AmbiantMemeCollection.delegate = self
//        AmbiantMemeCollection.dataSource = self
//        
        self.title = "MemeBox";
        
        
        //        //////
        //        /// Collection view SETUP
        //        let rect = UIView(frame: CGRect(x: -10, y: 0, width: 500, height: 35))
        //        rect.backgroundColor = UIColor.gray
        //        rect.alpha = 0.5
        //        MemeCollection.addSubview(rect)
        //
        //        let titleLabel = UILabel(frame: CGRect(x:10 , y: 5, width: 100 , height: 25))
        //        titleLabel.textAlignment = .center
        //        titleLabel.lineBreakMode = .byWordWrapping
        //        titleLabel.numberOfLines = 1
        //        titleLabel.text = "MemeBeats"
        //        titleLabel.textColor = UIColor.white
        //        MemeCollection.addSubview(titleLabel);
        
        //Define Layout here
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        //Get device width
        let width = UIScreen.main.bounds.width
        
        //set section inset as per your requirement.
        layout.sectionInset = UIEdgeInsets(top: 50, left: 20, bottom: 0, right: 20)
        
        //set cell item size here
        layout.itemSize = CGSize(width: width / 4, height: width / 4)
        
        //set Minimum spacing between 2 items
        layout.minimumInteritemSpacing = 0
        
        //set minimum vertical line spacing here between two lines in collectionview
        layout.minimumLineSpacing = 0
        
        //apply defined layout to collectionview
        MemeCollection!.collectionViewLayout = layout
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
//        if (collectionView == MemeCollection) {
//            cell.img.image = memeDB.memes[indexPath.row].img;
//        } else if (collectionView == AmbiantMemeCollection) {
//            cell.img.image = ambiantMemeDB.memes[indexPath.row].img;
//        }
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

