//
//  QuestionModel.swift
//  MedBay
//
//  Created by Justin Zhang on 4/20/22.
//

import Foundation

class Question {
    var id: Int
    var title: String
    var body: String
    
    init(id: Int, title: String, body: String) {
        self.id = id
        self.title = title
        self.body = body
    }
    
    var dictionary: [String: Any] {
        return ["id": id,
                "title": title,
                "body": body]
    }
    var nsDictionary: NSDictionary {
        return dictionary as NSDictionary
    }
}
