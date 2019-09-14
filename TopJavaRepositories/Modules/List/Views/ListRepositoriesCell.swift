//
//  ListRepositoriesCell.swift
//  TopJavaRepositories
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import UIKit
import SDWebImage
import FontAwesome_swift

class ListRepositoriesCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    @IBOutlet weak var pullRequests: UILabel!
    @IBOutlet weak var stars: UILabel!
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
    
    func configure(name: String, repoDescription: String, pullRequests: String, stars: String, repoImage: URL?, username: String) {

        self.name.text = name
        self.name.accessibilityLabel = "nome: \(name)"
        
        self.repoDescription.text = repoDescription
        self.repoDescription.accessibilityLabel = "descrição: \(repoDescription)"
        
        self.username.text = username
        self.username.accessibilityLabel = "usuário: \(username)"
        
        self.repoImage.sd_setImage(with: repoImage, placeholderImage: #imageLiteral(resourceName: "userLogo"))
        
        self.stars.setupIconWithText(text: stars, icon: FontAwesome.star)
        self.stars.accessibilityLabel = "estrelas: \(stars)"
        
        self.pullRequests.setupIconWithText(text: pullRequests, icon: FontAwesome.codeBranch)
        self.pullRequests.accessibilityLabel = "forks: \(pullRequests)"
        
    }    
}
