//
//  AllData.swift
//  CodeCheck
//
//  Created by 伊藤光次郎 on 2020/12/06.
//

import UIKit
import SwiftyJSON

class AllData: NSObject {

    var count:Int
    var gitData: [GitData] = []
    
    init(jsonResponse:JSON) {
        self.count = jsonResponse["total_count"].intValue
       
        for json in jsonResponse["items"].arrayValue{
            gitData.append(GitData(jsonResponse: json))
            
        }
    }
}
