//
//  AddPostViewController.swift
//  Instagram
//
//  Created by Nikolas Burk on 19/05/17.
//  Copyright © 2017 Nikolas Burk. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController {
  
  @IBOutlet weak var descriptionTextField: UITextField!
  @IBOutlet weak var imageUrlTextField: UITextField!
  
  var didCreatePost: ((PostDetails) -> ())?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func saveButtonPressed() {
    let description = descriptionTextField.text!
    let imageUrl = imageUrlTextField.text!
    let createPostMutation = CreatePostMutation(description: description, imageUrl: imageUrl)
    apollo.perform(mutation: createPostMutation) { result, error in
      self.presentingViewController?.dismiss(animated: true) {
        if let post = result?.data?.createPost?.fragments.postDetails {
          self.didCreatePost?(post)
        }
      }
    }
}
  
  @IBAction func cancelButtonPressed() {
    presentingViewController?.dismiss(animated: true)
  }
  
  
}
