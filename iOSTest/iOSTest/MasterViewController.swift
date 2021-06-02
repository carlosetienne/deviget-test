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

class MasterViewController: UITableViewController {
    var result  = [Any]()
    var dataArray = [RedditData]()

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
                        print(jsondata)
                        for children in jsondata.data.children {
                            var redditData: RedditData! = RedditData()
                            
                            redditData.author = children.data.author
                            redditData.comments = children.data.numComments
                            redditData.created = children.data.created
                            redditData.title = children.data.title
                            redditData.image = children.data.thumbnail
                            self.dataArray.append(redditData)
                        }
                        
                        self.tableView.reloadData()
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
        
        for d in dataArray {
            print(d.title)
        }
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getRedditJSON(whichReddit: "https://www.reddit.com/r/subreddit/top/.json?limit=50")
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        
        if data.image.count > 8 {
            let imageThumbnail = cell.viewWithTag(20) as? UIImageView
            let url = URL(string: data.image)
            let imageData = try? Data(contentsOf: url!)
            imageThumbnail?.image = UIImage(data: imageData!)
        }
      
        let titleLabel = cell.viewWithTag(21) as? UILabel
        titleLabel?.text = data.title
        
        let commentsLabel = cell.viewWithTag(31) as? UILabel
        commentsLabel?.text = "\(data.comments) comments"
        
        return cell
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
