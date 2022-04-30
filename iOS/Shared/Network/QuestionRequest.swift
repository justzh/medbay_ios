//
//  QuestionRequest.swift
//  MedBay (iOS)
//
//  Created by Justin Zhang on 4/21/22.
//

import Foundation

struct QuestionRequest {
    static var id = 1
    
    static func request(question: Question) {
        let params: Dictionary<String, Dictionary> = ["question": question.dictionary]
        
        var request = URLRequest(url: URL(string: "https://medbay-web.vercel.app/api/post-question")!)
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
