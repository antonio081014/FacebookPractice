//
//  FeedCell.swift
//  FacebookPractice
//
//  Created by Antonio081014 on 9/7/17.
//  Copyright © 2017 sample.com. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    var post: Post? {
        didSet {
            guard let post = post else { return }
            
            if let statusImage = post.statusImageName {
                self.statusImageView.image = UIImage(named: statusImage)
            }
            
            self.setupNameLocationStatusAndProfileImage()
        }
    }
    
    private func setupNameLocationStatusAndProfileImage() {
        guard let post = self.post else { return }
        let attributedText = NSMutableAttributedString(string: post.name ?? "", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSMutableAttributedString(string: "\nDecember 18 • San Francisco • ", attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor:UIColor.init(red: 155/255, green: 161/255, blue: 171/255, alpha: 1)]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        attributedText.addAttributes([NSAttributedStringKey.paragraphStyle:paragraphStyle], range: NSRange(location: 0, length: attributedText.string.characters.count))
        
        let attachment = NSTextAttachment()
        attachment.image = #imageLiteral(resourceName: "globe_small")
        attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
        attributedText.append(NSAttributedString(attachment: attachment))
        
        nameLabel.attributedText = attributedText
        
        self.statusTextView.text = post.statusText
        
        if let profileName = post.profileImageName {
            self.profileImageView.image = UIImage(named: profileName)
        }
        
        if let likes = post.numLikies, let comments = post.numComments {
            self.likesCommentLabel.text = "\(likes) Likes  \(comments) Comments"
        }
    }
    
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
        textView.isScrollEnabled = false
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
        
        self.statusImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.statusImageView.topAnchor.constraint(equalTo: self.statusTextView.bottomAnchor, constant: 8).isActive = true
        self.statusImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        self.statusImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
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
