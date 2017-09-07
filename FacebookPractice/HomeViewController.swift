//
//  ViewController.swift
//  FacebookPractice
//
//  Created by Antonio081014 on 9/4/17.
//  Copyright © 2017 sample.com. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Facebook Feed"
        
        self.collectionView?.alwaysBounceVertical = true
        self.collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        self.collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 400)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.collectionView?.collectionViewLayout.invalidateLayout()
    }
}

class FeedCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        let attributedText = NSMutableAttributedString(string: "Mark Zuckerberg", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSMutableAttributedString(string: "\nDecember 18 • San Francisco • ", attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor:UIColor.init(red: 155/255, green: 161/255, blue: 171/255, alpha: 1)]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        attributedText.addAttributes([NSAttributedStringKey.paragraphStyle:paragraphStyle], range: NSRange(location: 0, length: attributedText.string.characters.count))
        
        let attachment = NSTextAttachment()
        attachment.image = #imageLiteral(resourceName: "globe_small")
        attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
        attributedText.append(NSAttributedString(attachment: attachment))
        
        label.attributedText = attributedText
        return label
    }()
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "zuckprofile")
        return iv
    }()
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Meanwhile, Beast turned to the dark side."
        textView.font = UIFont.systemFont(ofSize: 14)
        return textView
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "zuckdog")
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let likesCommentLabel: UILabel = {
        let label = UILabel()
        label.text = "488 Likes    10,7k Comments"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.rgb(red: 155, green: 161, blue: 171)
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 226, green: 228, blue: 232)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let likeButton: UIButton = createButton(title: "Like", image: #imageLiteral(resourceName: "like"))
    let commentButton: UIButton = createButton(title: "Comment", image: #imageLiteral(resourceName: "comment"))
    let shareButton: UIButton = createButton(title: "Share", image: #imageLiteral(resourceName: "share"))
    
    static func createButton(title: String, image: UIImage) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.rgb(red: 143, green: 150, blue: 163), for: .normal)
        button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        return button
    }
    
    func setupViews() {
        self.backgroundColor = .white
        self.addSubview(self.nameLabel)
        self.addSubview(self.profileImageView)
        self.addSubview(self.statusTextView)
        self.addSubview(self.statusImageView)
        self.addSubview(self.likesCommentLabel)
        self.addSubview(self.dividerLineView)
        self.addSubview(self.likeButton)
        self.addSubview(self.commentButton)
        self.addSubview(self.shareButton)
        
        self.profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        self.profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.profileImageView.widthAnchor.constraint(equalTo: self.profileImageView.heightAnchor, constant: 0).isActive = true
        self.profileImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant:8).isActive = true
        self.nameLabel.bottomAnchor.constraint(equalTo: self.profileImageView.bottomAnchor, constant: 0).isActive = true
        self.nameLabel.leftAnchor.constraint(equalTo: self.profileImageView.rightAnchor, constant: 8).isActive = true
        self.nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        
        self.statusTextView.leftAnchor .constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.statusTextView.topAnchor.constraint(equalTo: self.profileImageView.bottomAnchor, constant: 8).isActive = true
        self.statusTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        self.statusTextView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.statusImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.statusImageView.topAnchor.constraint(equalTo: self.statusTextView.bottomAnchor, constant: 8).isActive = true
        self.statusImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        
        self.likesCommentLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.likesCommentLabel.topAnchor.constraint(equalTo: self.statusImageView.bottomAnchor, constant: 0).isActive = true
//        self.likesCommentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        self.likesCommentLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.likesCommentLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        self.dividerLineView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.dividerLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.dividerLineView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.dividerLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.likeButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.likeButton.topAnchor.constraint(equalTo: self.likesCommentLabel.bottomAnchor, constant: 0).isActive = true
        self.likeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        self.likeButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.likeButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        self.commentButton.topAnchor.constraint(equalTo: self.likesCommentLabel.bottomAnchor, constant: 0).isActive = true
        self.commentButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        self.commentButton.leftAnchor.constraint(equalTo: self.likeButton.rightAnchor, constant: 8).isActive = true
        self.commentButton.heightAnchor.constraint(equalTo: self.likeButton.heightAnchor, constant: 0).isActive = true
        self.commentButton.widthAnchor.constraint(equalTo: self.likeButton.widthAnchor, constant: 0).isActive = true
        
        self.shareButton.topAnchor.constraint(equalTo: self.likesCommentLabel.bottomAnchor, constant: 0).isActive = true
        self.shareButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        self.shareButton.leftAnchor.constraint(equalTo: self.commentButton.rightAnchor, constant: 8).isActive = true
        self.shareButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.shareButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.shareButton.widthAnchor.constraint(equalTo: self.likeButton.widthAnchor, constant: 0).isActive = true
    }
}
