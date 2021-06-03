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
    @IBOutlet weak var imageButton: UIButton!
    var currentImage: UIImage!
    
    @IBAction func saveImageButton(_ sender: Any) {
        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: currentImage)
    }
    
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
            if let image = UIImage(named: post?.image ?? "placeholder") {
                currentImage = image
                imageButton.setImage(image, for: .normal)
            }
        } else{
            let image = UIImage(named:"placeholder")
            currentImage = image
            imageButton.setImage(image, for: .normal)
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
    
    class ImageSaver: NSObject {
        func writeToPhotoAlbum(image: UIImage) {
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
        }

        @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
            print("Save finished!")
        }
    }
}

extension DetailViewController: postSelectionDelegate {
    func postSelected(_ newPost: RedditData){
    post = newPost
  }
}
