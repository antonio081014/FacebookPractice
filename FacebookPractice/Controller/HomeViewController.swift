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
        mark.statusText = "Meanwhile, Beast turned to the dark side."
        
        let steve = Post()
        steve.name = "Steve Jobs"
        steve.statusText = "Long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long story."
        
        self.posts.append(mark)
        self.posts.append(steve)
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
            return CGSize(width: collectionView.bounds.width, height: 8 + rect.height + 8 + 44 + 8 + 200 + 24 + 8 + 44 + 16)
        }
        return CGSize(width: collectionView.bounds.width, height: 400)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.collectionView?.collectionViewLayout.invalidateLayout()
    }
}
