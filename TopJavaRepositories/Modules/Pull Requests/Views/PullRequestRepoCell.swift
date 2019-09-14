//
//  PullRequestRepoCell.swift
//  TopJavaRepositories
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import UIKit

class PullRequestRepoCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var pullDescription: UILabel!
    @IBOutlet weak var repoImage: UIImageView!
    @IBOutlet weak var username: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        repoImage.layer.cornerRadius = repoImage.frame.width/2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(name: String, pullDescription: String, repoImage: URL?, username: String) {
        
        self.name.text = name
        self.pullDescription.text = pullDescription
        self.username.text = username
        self.repoImage.sd_setImage(with: repoImage, placeholderImage: #imageLiteral(resourceName: "userLogo"))
    }
}
