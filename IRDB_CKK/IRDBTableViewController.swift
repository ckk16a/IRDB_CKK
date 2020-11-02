//
//  IRDBTableViewController.swift
//  IRDB_CKK
//
//  Created by Carson Kelley on 10/20/20.
//

import UIKit

class IRDBTableViewController: UITableViewController {
    
    var mediaModel: MediaDataModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var dataController = DataController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "IRDb"
        
        // 1
        let nav = self.navigationController?.navigationBar
          
        // 2
        nav?.barStyle = UIBarStyle.black
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        nav?.barTintColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        nav?.tintColor = UIColor.init(red: 255/255, green: 255/255, blue: 0/255, alpha: 1)
          
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        imageView.contentMode = .scaleAspectFit
              
        // 4
        let image = UIImage(named: "irdblogo")
        imageView.image = image
              
        // 5
        navigationItem.titleView = imageView
        
        //call my dataController and then wait
        dataController.getJSONData(completion: {dataModel in
            self.mediaModel = dataModel
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return mediaModel?.batmanSeries.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaModel?.batmanSeries[section].media.count ?? 0
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mediaModel?.batmanSeries[section].seriesType
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = mediaModel?.batmanSeries[indexPath.section].media[indexPath.row].mediaName
        
        cell.detailTextLabel?.text = mediaModel?.batmanSeries[indexPath.section].media[indexPath.row].directorOrCreator

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showMediaDetail"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let selectedObject = mediaModel!.batmanSeries[indexPath.section].media[indexPath.row]
                let controller = segue.destination as! DetailViewController
            controller.detailItem = selectedObject
            }
        }
    }
}
