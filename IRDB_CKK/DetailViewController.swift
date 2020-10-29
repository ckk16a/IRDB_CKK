//
//  ViewController.swift
//  IRDB_CKK
//
//  Created by Carson Kelley on 10/20/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet var mediaImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var formatLabel: UILabel!
    @IBOutlet var episodesLabel: UILabel!
    @IBOutlet var studioLabel: UILabel!
    
    var detailItem: Entry? {
        didSet {
            configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = detailItem?.name
        
        let nav = self.navigationController?.navigationBar
          
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.init(red: 245/255, green: 196/255, blue: 72/255, alpha: 1)
        
        configureView()
    }
    
    func configureView() {
        
        if let entry = detailItem{
            //header view
            
            //NEED that image from URL
            
            
            if let thisMediaImage = mediaImage {
                guard let imageURL = URL(string: entry.imageURL) else { return }

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
                thisTitleLabel.text = entry.name
            }
            if let thisYearLabel = yearLabel {
                // NEED SOME FORMATTING HERE!!
                // year needs to JUST show the year if there is only the yearStart
                // IF there is also a yearEnd "yearStart - yearEnd"
                if let yearEnd = entry.yearEnd {
                    thisYearLabel.text = "\(entry.yearStart) - \(yearEnd)"
                }
                else {
                    thisYearLabel.text = entry.yearStart
                }
            }
            if let thisFormatLabel = formatLabel {
                thisFormatLabel.text = entry.format
            }
            if let thisEpisodeLabel = episodesLabel {
                if let episodeCount = entry.episodes {
                    
                    //IF there is only ONE episode, take that S off the end of Episodes
                    if(episodeCount == 1){
                        thisEpisodeLabel.text = "1 Episode"
                    } else {
                        thisEpisodeLabel.text = "\(episodeCount) Episodes"
                    }
                } else {
                    thisEpisodeLabel.text = ""
                }
            }
            if let thisStudioLabel = studioLabel {
                thisStudioLabel.text = entry.studio
            }
            
            //bottom view
            if let thisDescriptionLabel = descriptionLabel {
                thisDescriptionLabel.text = entry.description
            }
            
            if let thisSummaryTextView = summaryTextView {
                thisSummaryTextView.text = entry.summary
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showCastList"{
//
            let contoller = segue.destination as! CastTableViewController
            contoller.castListArray = detailItem?.starring
        }
    }

}

