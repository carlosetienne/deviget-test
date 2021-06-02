//
//  DetailViewController.swift
//  iOSTest
//
//  Created by Carlos Ancona on 5/31/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleText: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var post: RedditData? {
      didSet {
        refreshUI()
      }
    }
    
    private func refreshUI() {
      loadViewIfNeeded()
        authorLabel.text = post?.author
        titleText.text = post?.title
        
        if post?.image.count ?? 0 > 8 {
            let url = URL(string: post?.image ?? "")
            let imageData = try? Data(contentsOf: url!)
            imageView?.image = UIImage(data: imageData!)
        } else{
            imageView?.image = UIImage(named:"placeholder")!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: postSelectionDelegate {
    func postSelected(_ newPost: RedditData){
    post = newPost
  }
}
