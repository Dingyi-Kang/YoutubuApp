//
//  CustomTableViewCell.swift
//  youtube
//
//  Created by OSU App Center on 7/30/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbNailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?{
        didSet{
            titleLabel.text = video?.title
            let df = DateFormatter()
            df.dateFormat = "EEEE, MMM d, yyyy"
            dateLabel.text = df.string(from: video!.published)
            
            //set thumbnail
            let urlString = video!.thumbnail
            
            //check 
            if let data = CacheManager.getURLData(urlString: urlString){
                DispatchQueue.main.async {
                    self.thumbNailImageView.image = UIImage(data: data)
                }
                return
            }
            
            let url = URL(string: urlString)
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: url!) { (data, response, error) in
                //after complete downloading
                //first check if the data is still needed
                if url!.absoluteString != self.video!.thumbnail{
                    return
                }
    
                if data != nil && error == nil {
                    //save data to cache and pass it to image
                    CacheManager.saveURLData(urlString: url!.absoluteString, data: data!)
                    
                    DispatchQueue.main.async {
                        self.thumbNailImageView.image = UIImage(data: data!)
                    }
                }
            }
            dataTask.resume()
            
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
