//
//  PostTableViewController.swift
//  Instagram
//
//  Created by Nikolas Burk on 19/05/17.
//  Copyright © 2017 Nikolas Burk. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {
  
  var posts: [PostDetails] = [] {
    didSet {
      tableView.reloadData()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    apollo.fetch(query: AllPostsQuery()) { result, error in
      if let allPosts = result?.data?.allPosts {
        self.posts = allPosts.map { $0.fragments.postDetails }
      }
    }
  }
  
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
    cell.descriptionLabel.text = posts[indexPath.row].description
    cell.imageUrl = posts[indexPath.row].imageUrl
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let addPostViewController = segue.destination as! AddPostViewController
    addPostViewController.didCreatePost = { post in
      self.posts.append(post)
    }
  }
  
}
