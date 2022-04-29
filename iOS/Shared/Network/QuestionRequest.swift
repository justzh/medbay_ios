//
//  QuestionRequest.swift
//  MedBay (iOS)
//
//  Created by Justin Zhang on 4/21/22.
//

import Foundation

struct QuestionRequest {
    static var id = 1
    
    static func request() {
        let question: Question = Question(id: id, title: "\(id)", body: "\(id)")
        id += 1
        let params: Dictionary<String, Dictionary> = ["question": question.dictionary]
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/api/post-question")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
            } catch {
                print("error")
            }
        })

        task.resume()
    }
}
