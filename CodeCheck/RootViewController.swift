//
//  ViewController.swift
//  CodeCheck
//
//  Created by 伊藤光次郎 on 2020/12/05.
//

import UIKit
import Alamofire
import SwiftyJSON

class RootViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate,UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
   
    var allData:AllData?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.allData == nil{
            return 0
        }else {
            return allData!.gitData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if self.allData == nil{
           
            return cell
        }else {
           
            cell.textLabel!.text = "\(allData!.gitData[indexPath.row].name)"
            return cell
        }
       
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        detailViewController.iconURL = allData!.gitData[indexPath.row].icon
        detailViewController.name = allData!.gitData[indexPath.row].name
        detailViewController.lang = allData!.gitData[indexPath.row].lang
        detailViewController.star = allData!.gitData[indexPath.row].star
        detailViewController.watcher = allData!.gitData[indexPath.row].watcher
        detailViewController.fork = allData!.gitData[indexPath.row].fork
        detailViewController.issue = allData!.gitData[indexPath.row].issue
        detailViewController.modalPresentationStyle = .fullScreen
        self.present(detailViewController, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       
        AF.request("https://api.github.com/search/repositories?q=\(searchBar.text!)+in:name&sort=stars").responseJSON{ [self]
            response in
            //responseには通信したデータが入る
            switch response.result{
            case .success(let value):
                print("通信成功")
               
                self.allData = AllData(jsonResponse: JSON(value))
                self.tableView.reloadData()
                
                
            case .failure(let value):
                print("通信失敗")
                debugPrint(value)
            }
        }
        searchBar.resignFirstResponder()
    }
}

