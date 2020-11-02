//
//  ViewController.swift
//  IRDB_CKK
//
//  Created by Carson Kelley on 10/20/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var whereToWatchLabel: UILabel!
    @IBOutlet weak var storyLineView: UITextView!
    @IBOutlet var mediaImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var releaseLabel: UILabel!
    @IBOutlet var directorLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var runTimeLabel: UILabel!
    
    var detailItem: Media? {
        didSet {
            configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = detailItem?.mediaName
        
        let nav = self.navigationController?.navigationBar
          
        nav?.barStyle = UIBarStyle.black
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        nav?.tintColor = UIColor.init(red: 255/255, green: 255/255, blue: 0/255, alpha: 1)
        
        configureView()
    }
    
    func configureView() {
        
        if let media = detailItem{
            //header view
            
            //NEED that image from URL
            
            
            if let thisMediaImage = mediaImage {
                guard let imageURL = URL(string: media.imageLink) else { return }

                        // just not to cause a deadlock in UI!
                    DispatchQueue.global().async {
                        guard let imageData = try? Data(contentsOf: imageURL) else { return }

                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            thisMediaImage.image = image
                        }
                    }
            }
            
            if let thisTitleLabel = titleLabel {
                thisTitleLabel.text = media.mediaName
            }
            if let thisReleaseLabel = releaseLabel {
                thisReleaseLabel.text = media.releaseDate
            }
            if let thisDirectorLabel = directorLabel {
                thisDirectorLabel.text = media.directorOrCreator
            }
            if let thisGenreLabel = genreLabel {
                thisGenreLabel.text = media.genre
            }
            if let thisRunTimeLabel = runTimeLabel {
                thisRunTimeLabel.text = media.runTime
            }
            
            //bottom view
            if let thisWhereToWatchLabel = whereToWatchLabel {
                thisWhereToWatchLabel.text = media.whereToWatch
            }
            
            if let thisStoryLine = storyLineView {
                thisStoryLine.text = media.storyLine
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showCastList"{
//
            let contoller = segue.destination as! CastTableViewController
            contoller.castListArray = detailItem?.cast
        }
    }

}

