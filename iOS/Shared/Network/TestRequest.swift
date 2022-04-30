//
//  TestRequest.swift
//  MedBay (iOS)
//
//  Created by Justin Zhang on 4/21/22.
//

import Foundation

struct TestRequest {
    static func request() {

        var request = URLRequest(url: URL(string: "https://medbay-web.vercel.app/api/test")!)
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
