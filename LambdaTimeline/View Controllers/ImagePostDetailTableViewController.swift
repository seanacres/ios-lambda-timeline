//
//  ImagePostDetailTableViewController.swift
//  LambdaTimeline
//
//  Created by Spencer Curtis on 10/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ImagePostDetailTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        
        guard let imageData = imageData,
            let image = UIImage(data: imageData) else { return }
        
        title = post?.title
        
        imageView.image = image
        
        titleLabel.text = post.title
        authorLabel.text = post.author.displayName
    }
    
    // MARK: - Table view data source
    
    @IBAction func createComment(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add a Comment", message: nil, preferredStyle: .alert)
        
//        var commentTextField: UITextField?
        
//        alert.addTextField { (textField) in
//            textField.placeholder = "Comment:"
//            commentTextField = textField
//        }
        let addTextCommentAction = UIAlertAction(title: "Text Comment", style: .default) { (_) in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "ShowTextCommentVC", sender: nil)
            }
        }
        
        let addAudioCommentAction = UIAlertAction(title: "Audio Comment", style: .default) { (_) in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "ShowAudioCommentVC", sender: nil)
            }
        }
        
//        let addCommentAction = UIAlertAction(title: "Add Text Comment", style: .default) { (_) in
            
//            guard let commentText = commentTextField?.text else { return }
//
//            self.postController.addComment(with: commentText, to: &self.post!)
//
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(addTextCommentAction)
        alert.addAction(addAudioCommentAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (post?.comments.count ?? 0) - 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath)
        
        let comment = post?.comments[indexPath.row + 1]
        
        cell.textLabel?.text = comment?.text
        cell.detailTextLabel?.text = comment?.author.displayName
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let commentVC = segue.destination as? CommentViewController
        commentVC?.postController = postController
        commentVC?.post = post
        
        if segue.identifier == "ShowTextCommentVC" {
            commentVC?.isAudioComment = false
        } else if segue.identifier == "ShowAudioCommentVC" {
            commentVC?.isAudioComment = true
        }
    }
    
    var post: Post!
    var postController: PostController!
    var imageData: Data?
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imageViewAspectRatioConstraint: NSLayoutConstraint!
}
