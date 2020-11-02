//
//  CastTableViewController.swift
//  IRDB_CKK
//
//  Created by Carson Kelley on 10/29/20.
//

import UIKit

class CastTableViewController: UITableViewController {
    
    var castListArray: [Featured]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nav = self.navigationController?.navigationBar
          
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        nav?.barTintColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        nav?.tintColor = UIColor.init(red: 255/255, green: 255/255, blue: 0/255, alpha: 1)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return castListArray?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "castCell", for: indexPath)

        // Configure the cell
        
        // ... use the values in the array to make cast list cell pretty
        cell.textLabel?.text = castListArray?[indexPath.row].actorName
        
        cell.detailTextLabel?.text = "as  \"\(castListArray?[indexPath.row].role ?? "")\""

        return cell
    }
}
