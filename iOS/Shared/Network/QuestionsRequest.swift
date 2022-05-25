//
//  QuestionsRequest.swift
//  MedBay (iOS)
//
//  Created by Justin Zhang on 4/30/22.
//

import Foundation

struct QuestionsRequest {

    static func request(_ completion: @escaping ([Question]) -> Void) {
        var request = URLRequest(url: URL(string: "https://medbay.vercel.app/api/get-questions")!)
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! [Dictionary<String, AnyObject>]
                
                var questions: [Question] = []
                for i in json {
                    let question = Question(id: i["id"] as! Int,
                                            title: i["title"] as! String,
                                            body: i["body"] as! String)
                    questions.append(question)
                }
                
                completion(questions)
            } catch {
                print("error")
            }
        })

        task.resume()
    }
}
