//
//  JsonModel.swift
//  InfoSysInterview
//
//  Created by Neha Singh on 19/04/20.
//  Copyright © 2020 Neha Singh. All rights reserved.
//

import Foundation
import SwiftyJSON

struct JsonModel {
    var artistName : String = ""
    var trackCensoredName : String = ""
    var artistViewUrl : String = ""
    
    init(json: JSON) {
        artistName = json["artistName"].stringValue
        trackCensoredName = json["trackCensoredName"].stringValue
        artistViewUrl =  json["artworkUrl30"].stringValue
        
    }
}
