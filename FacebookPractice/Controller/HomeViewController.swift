//
//  ViewController.swift
//  FacebookPractice
//
//  Created by Antonio081014 on 9/4/17.
//  Copyright © 2017 sample.com. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var posts = [Post]()
    
    private let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Facebook Feed"
        
        self.collectionView?.alwaysBounceVertical = true
        self.collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        self.collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellID)
        
        let mark = Post()
        mark.name = "Mark Zuckerberg"
        mark.statusText = "By giving people the power to share, we're making the world more transparent."
        mark.profileImageName = "zuckprofile"
        mark.statusImageName = "zuckdog"
        mark.numLikies = 150
        mark.numComments = 300
        
        
        let steve = Post()
        steve.name = "Steve Jobs"
        steve.statusText = "Design is not just what it looks like and feels like. Design is how it works.\n\nBeing the richest man in the cemetery doesn't matter to me. Going to bed at night saying we've done something wonderful, that's what matters to me.\n\nSometimes when you innovate, you make mistakes. It is best to admit them quickly, and get on with improving your other innovations."
        steve.profileImageName = "steve_profile"
        steve.statusImageName = "steve_status"
        steve.numLikies = 111
        steve.numComments = 222
        
        let gandhi = Post()
        gandhi.name = "Mahatma Gandhi"
        gandhi.statusText = "Live as if you were to die tomorrow; learn as if you were to live forever.\nThe weak can never forgive. Forgiveness is the attribute of the strong.\nHappiness is when what you think, what you say, and what you do are in harmony."
        gandhi.profileImageName = "gandhi_profile"
        gandhi.statusImageName = "gandhi_status"
        gandhi.numLikies = 333
        gandhi.numComments = 444
        
        self.posts.append(mark)
        self.posts.append(steve)
        self.posts.append(gandhi)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FeedCell
        cell.post = self.posts[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let text = self.posts[indexPath.row].statusText {
            let rect = NSString(string: text).boundingRect(with: CGSize(width: collectionView.bounds.width - 8 - 8, height: 1000), options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 14)], context: nil)
            return CGSize(width: collectionView.bounds.width, height: 8 + rect.height + 8 + 44 + 8 + 200 + 24 + 8 + 44 + 18)
        }
        return CGSize(width: collectionView.bounds.width, height: 400)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.collectionView?.collectionViewLayout.invalidateLayout()
    }
}
