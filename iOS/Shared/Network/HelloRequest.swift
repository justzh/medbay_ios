//
//  HelloRequest.swift
//  MedBay (iOS)
//
//  Created by Justin Zhang on 4/21/22.
//

import Foundation

struct HelloRequest {
    static func request() {

        var request = URLRequest(url: URL(string: "https://medbay.vercel.app/api/hello")!)
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
