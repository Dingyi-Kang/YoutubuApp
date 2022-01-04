//
//  ViewController.swift
//  youtube
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
    
    var model = Model()
    var videos = [Video]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        
        
        model.delegate = self
        model.getVideos()
        
        
        tableView.delegate = self
        tableView.dataSource = self
       
    }


    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId, for: indexPath) as? CustomTableViewCell {
            
            cell.video = videos[indexPath.row]
            return cell
        }
        else {
            return UITableViewCell()
        }
        
//        if let label = tableView.viewWithTag(2) as? UILabel {
//            label.text = videos[indexPath.row].title
//        }
        
    }
    
    //this method is called when the segue/transition occurs
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        let video = self.videos[tableView.indexPathForSelectedRow!.row]
        
        //get reference to the detail VC in segue
        let vc = segue.destination as! DetailViewController
        
        vc.video = video
        vc.videoIndex = tableView.indexPathForSelectedRow!.row + 1
    }
    
    
}


extension ViewController: modelDelegate{
    func passResponse(resp: Response) {
        videos = resp.videos!
        //dont forget to reload data, this is the key, like refreshing
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
