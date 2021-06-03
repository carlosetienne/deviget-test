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
    var isSmallImagen = true
    var oldImageButtonX: CGFloat = 0.0
    var oldImageButtonY: CGFloat = 0.0

    //Action that saves the UIImage in the photo gallery
    @IBAction func saveImageButton(_ sender: Any) {
        if isSmallImagen {
            let imageSaver = ImageSaver()
            imageSaver.writeToPhotoAlbum(image: currentImage)
            let screenSize: CGRect = UIScreen.main.bounds
            let screenWidth = screenSize.width
            let screenHeight = screenSize.height
            
            oldImageButtonX = imageButton.frame.origin.x
            oldImageButtonY = imageButton.frame.origin.y

            imageButton.contentVerticalAlignment = .fill
            imageButton.contentHorizontalAlignment = .fill
            imageButton.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
            isSmallImagen = false
        } else{
            imageButton.frame = CGRect(x: oldImageButtonX, y: oldImageButtonY, width: 100, height: 100)
            isSmallImagen = true
        }
       
    }
    
    //Refreshes the UI
    var post: RedditData? {
      didSet {
        refreshUI()
      }
    }
    
    //Function that refresh the UI
    private func refreshUI() {
      loadViewIfNeeded()
        authorLabel.text = post?.author
        titleText.text = post?.title
        
        let url = URL(string: post?.image ?? "https://i.stack.imgur.com/y9DpT.jpg")
        let imageData = try? Data(contentsOf: url!)
        currentImage = UIImage(data: imageData!)
        imageButton.setImage(currentImage, for: .normal)

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
    
    //Class created to save the UIImage on PhotoAlbum
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
