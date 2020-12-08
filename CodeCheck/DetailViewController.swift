//
//  DetailViewController.swift
//  CodeCheck
//
//  Created by 伊藤光次郎 on 2020/12/08.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var langLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var watchLabel: UILabel!
    @IBOutlet weak var forkLabel: UILabel!
    @IBOutlet weak var issueLabel: UILabel!
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    var iconURL : String?
    var name : String?
    var lang : String?
    var star : Int?
    var watcher : Int?
    var fork : Int?
    var issue : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let data = try? Data(contentsOf: URL(string: iconURL!)!),
           let image = UIImage(data: data) {
           self.image.image = image
            
        }
        
        self.nameLabel.text = name
        self.langLabel.text = "Written in \(lang!)"
        self.starLabel.text = "\(star!) stars"
        self.watchLabel.text = "\(watcher!) watchers"
        self.forkLabel.text = "\(fork!) forks"
        self.issueLabel.text = "\(issue!) open issues"
        // Do any additional setup after loading the view.
    }
    
    
}
