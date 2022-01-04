//
//  DetailViewController.swift
//  youtube
//
//  Created by OSU App Center on 7/31/21.
//

import UIKit
import WebKit


class DetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?
    var videoIndex:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //go in deeper of life cycle of the view
    override func viewWillAppear(_ animated: Bool) {
        //clear the fields
        
        //check if there is a video
        guard video != nil, videoIndex != nil else {
            return
        }
        
        //create embed url
        
        //load into the webkit
        
        
        
        let urlString = "https://www.youtube.com/watch?v=\(video!.videoId)&list=PL5Pdci3KjLN-fLNxsaqS2gQVX1zGDqu5j&index=\(videoIndex!)"
        
        let url = URL(string:urlString)
        let request = URLRequest(url: url!)
        self.webView.load(request)
        
        //set the title
        self.titleLabel.text = video!.title
        //set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        //set the description
        self.textView.text = video!.description
    }

}
