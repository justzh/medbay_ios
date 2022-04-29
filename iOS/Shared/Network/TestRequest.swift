//
//  TestRequest.swift
//  MedBay (iOS)
//
//  Created by Justin Zhang on 4/21/22.
//

import Foundation

struct TestRequest {
    static func request() {

        var request = URLRequest(url: URL(string: "http://localhost:3000/api/test")!)
        request.httpMethod = "GET"
        
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
