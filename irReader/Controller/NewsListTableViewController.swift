//
//  NewsListTableViewController.swift
//  irReader
//
//  Created by Fuxing Xue on 17/2/20.
//  Copyright © 2017年 Fuxing Xue. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NewsListTableViewController: UITableViewController {
    var newsList:[NewsItem] = []

    func fetchNewsList(){
        let url = fetchUrl(style: .getList)
        Alamofire.request(url).responseJSON { response in
            if let jsonData = response.data{
                let json = JSON(data: jsonData)
                for (_,subJson):(String,JSON) in json["result"][0] {
                    let newsItem: NewsItem = NewsItem(title: subJson["title"].stringValue, url: subJson["titleurl"].stringValue)
                    self.newsList.append(newsItem)
                    self.tableView.reloadData()
                    print(self.newsList.count)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNewsList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCellIdentifier", for: indexPath)

        cell.textLabel?.text = newsList[indexPath.row].title

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}