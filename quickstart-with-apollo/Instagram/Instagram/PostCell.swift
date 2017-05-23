//
//  PostCell.swift
//  Instagram
//
//  Created by Nikolas Burk on 19/05/17.
//  Copyright © 2017 Nikolas Burk. All rights reserved.
//

import UIKit
import SDWebImage

class PostCell: UITableViewCell {
  
  @IBOutlet weak var postImageView: UIImageView!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  var imageUrl: String? {
    didSet {
      guard let actualImageUrl = self.imageUrl,
        let url = URL(string: actualImageUrl) else {return}
      postImageView.sd_setImage(with: url)
    }
  }
  
  override func prepareForReuse() {
    postImageView.image = nil
  }
  
}
