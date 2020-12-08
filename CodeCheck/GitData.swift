//
//  GitData.swift
//  CodeCheck
//
//  Created by 伊藤光次郎 on 2020/12/06.
//

import UIKit
import SwiftyJSON

class GitData: NSObject {

    let name:String
    let icon:String
    let lang:String
    let star:Int
    let watcher:Int
    let fork:Int
    let issue:Int
    
    init(jsonResponse:JSON) {
        
        self.name = jsonResponse["full_name"].stringValue
        self.icon = jsonResponse["owner"]["avatar_url"].stringValue
        self.lang = jsonResponse["language"].stringValue
        self.star = jsonResponse["stargazers_count"].intValue
        self.watcher = jsonResponse["watchers_count"].intValue
        self.fork = jsonResponse["forks_count"].intValue
        self.issue = jsonResponse["open_issues_count"].intValue
    }
}
