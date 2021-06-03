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
    var created: String = ""
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
    var selectedPosition: Int = 0
    
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

    //This function retrieves the Json data from Reddit API using URL Session and add it to an array
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
                            redditData.title = children.data.title
                            redditData.image = children.data.thumbnail
                            
                            let timeInterval = TimeInterval(children.data.created)
                            let myNSDate = Date(timeIntervalSince1970: timeInterval)
                            
                            let interval = Date() - myNSDate
                            redditData.created = "\(interval.hour ?? 0) hours ago"
                            
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
    
    //Just a little workaround to setup the SplitViewController if its an iPhone
    func validateSelect() {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.tableView?.deselectRow(at: IndexPath(row: 0, section: 0), animated: false)
        }
    }
    
    //Setup some views and adds the refresh control to the TableView
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        self.tableView?.refreshControl = refreshControl
        setupSplit()
        validateSelect()
        getRedditJSON(whichReddit: "https://www.reddit.com/r/funny/top/.json?limit=50")

    }
    
    @objc func refresh(_ sender: AnyObject) {
        getRedditJSON(whichReddit: "https://www.reddit.com/r/funny/top/.json?limit=50")
        refreshControl.endRefreshing()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        validateSelect()
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    //Add data to the Custom Cells using the Cell identifier
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
        
        let hoursLabel = cell.viewWithTag(12) as? UILabel
        hoursLabel?.text = data.created
        
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
        
        let dismissButton = cell.viewWithTag(30) as? UIButton
        dismissButton?.tag = indexPath.row
        dismissButton?.addTarget(self, action: #selector(self.dismissPost(_:)), for: .touchUpInside)

        return cell
    }
    
    //function that removes one post from list
    @objc func dismissPost(_ sender: AnyObject) {
        dataArray.remove(at: sender.tag)
        self.tableView?.reloadData()
    }
    
    //protocol in charge of send to the delegate of DetailViewController the information needed to show the data in the view
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

extension Date {
    static func -(recent: Date, previous: Date) -> (month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?) {
        let day = Calendar.current.dateComponents([.day], from: previous, to: recent).day
        let month = Calendar.current.dateComponents([.month], from: previous, to: recent).month
        let hour = Calendar.current.dateComponents([.hour], from: previous, to: recent).hour
        let minute = Calendar.current.dateComponents([.minute], from: previous, to: recent).minute
        let second = Calendar.current.dateComponents([.second], from: previous, to: recent).second

        return (month: month, day: day, hour: hour, minute: minute, second: second)
    }
}
