//
//  TopicsTableViewController.swift
//  Structs
//
//  Created by paco williams on 10/17/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class TopicsTableViewController: UITableViewController {

    
    @IBOutlet var table: UITableView!
    var DataStructure: String!
    var Topics: [Topic]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = DataStructure

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Topics.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicCell
        
        
        let topic = Topics[indexPath.row]
        
        
        let isLocked: Bool
        
        cell.Name.text! = topic.name
        
        if indexPath.row == 0 { //first topic always unlocked
            isLocked = false
            return cell
        }
        
        //next topic only unlocked if previous is completed
        let pastTopic = Topics[indexPath.row-1]
        isLocked = pastTopic.completed ? false: true
        cell.Locked.image = UIImage(systemName: isLocked ? "lock.fill": "lock.open.fill")

        return cell
    }

    
    





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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let FlashcardView = segue.destination as! FlashcardViewController
        
        
        
        
        let topic = Topics[table.indexPathForSelectedRow!.row]
        
        FlashcardView.Flashcards = topic.flashcards
        FlashcardView.TopicName = topic.name
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


}
