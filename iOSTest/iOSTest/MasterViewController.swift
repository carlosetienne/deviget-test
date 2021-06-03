//
//  MasterViewController.swift
//  iOSTest
//
//  Created by Carlos Ancona on 5/31/21.
//

import UIKit
import Foundation

struct RedditData{
    var title : String = ""
    var author: String = ""
    var comments: Int = 0
    var created: Int = 0
    var seen: Bool = false
    var image: String = ""
}

protocol postSelectionDelegate: class {
  func postSelected(_ newPost: RedditData)
}

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var result  = [Any]()
    var dataArray = [RedditData]()
    weak var delegate: postSelectionDelegate?
    var refreshControl = UIRefreshControl()

    @IBOutlet weak var tableView: UITableView?

    @IBAction func dismissAll(_ sender: Any) {
        dataArray.removeAll()
        self.tableView?.reloadData()
    }
    
    func setupSplit() {
        splitViewController?.delegate = self
        splitViewController!.preferredDisplayMode = UISplitViewController.DisplayMode.oneOverSecondary
        splitViewController!.preferredDisplayMode = UISplitViewController.DisplayMode.oneBesideSecondary
    }

    func getRedditJSON(whichReddit : String){
        let newJSONDecoder = JSONDecoder()
        
        let mySession = URLSession.shared
        let url: NSURL = NSURL(string: whichReddit)!
        let networkTask = mySession.dataTask(with: url as URL, completionHandler : { data, response, error -> Void in
            guard error == nil else {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let jsondata = try newJSONDecoder.decode(newJSONDecoderRedditModel.self, from: data)
                        for children in jsondata.data.children {
                            var redditData: RedditData! = RedditData()
                            
                            redditData.author = children.data.author
                            redditData.comments = children.data.numComments
                            redditData.created = children.data.created
                            redditData.title = children.data.title
                            redditData.image = children.data.thumbnail
                            
                            if self.dataArray.first(where: { $0.title == children.data.title }) != nil {
                               print("Already Exists")
                            } else {
                                self.dataArray.append(redditData)
                            }
                        }
                        
                        self.tableView?.reloadData()
                    } catch {
                        print(error)
                    }
                }
            }
        })
        networkTask.resume()
    }
    
    func addToDataArray(data: newJSONDecoderRedditModel){
        for children in data.data.children {
            var redditData: RedditData! = RedditData()
            redditData.author = children.data.author
            redditData.comments = children.data.numComments
            redditData.created = children.data.created
            redditData.title = children.data.title
            redditData.seen = false
            dataArray.append(redditData)
        }
        
        self.tableView?.reloadData()
    }
    
    func validateSelect() {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.tableView?.deselectRow(at: IndexPath(row: 0, section: 0), animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        self.tableView?.refreshControl = refreshControl
        setupSplit()
        validateSelect()
        getRedditJSON(whichReddit: "https://www.reddit.com/r/subreddit/top/.json?limit=50")

    }
    
    @objc func refresh(_ sender: AnyObject) {
        getRedditJSON(whichReddit: "https://www.reddit.com/r/subreddit/top/.json?limit=50")
        refreshControl.endRefreshing()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        validateSelect()
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let data = dataArray[indexPath.row]
        
        let seenImage = cell.viewWithTag(10) as? UIImageView
        if data.seen == false {
            seenImage?.tintColor = .blue
        } else {
            seenImage?.tintColor = .black
        }
        
        let authorLabel = cell.viewWithTag(11) as? UILabel
        authorLabel?.text = data.author
        
        let imageThumbnail = cell.viewWithTag(20) as? UIImageView
        if data.image.count > 8 {
            let url = URL(string: data.image)
            let imageData = try? Data(contentsOf: url!)
            imageThumbnail?.image = UIImage(data: imageData!)
        } else{
            imageThumbnail?.image = UIImage(named:"placeholder")!
        }
      
        let titleLabel = cell.viewWithTag(21) as? UILabel
        titleLabel?.text = data.title
        
        let commentsLabel = cell.viewWithTag(31) as? UILabel
        commentsLabel?.text = "\(data.comments) comments"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let selectedPost = dataArray[indexPath.row]
        dataArray[indexPath.row].seen = true
        delegate?.postSelected(selectedPost)
        tableView.reloadData()
        if let detailViewController = delegate as? DetailViewController {
          splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MasterViewController: UISplitViewControllerDelegate {
    func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
        return .primary
    }
}
