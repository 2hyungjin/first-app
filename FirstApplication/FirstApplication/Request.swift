//
//  Request.swift
//  FirstApplication
//
//  Created by 이형진 on 2022/06/28.
//

import Foundation
let DidReceiveFriendsNotification :Notification.Name = Notification.Name("DidRecieveFriends")
func requestFriends(){
    guard let url:URL = URL(string : "https://randomuser.me/api/?results=20&inc=name,email,picture") else {return}
    
    let session : URLSession = URLSession(configuration: .default)
    
    let dataTask : URLSessionDataTask = session.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
        if let error = error{
            print(error.localizedDescription)
            return
        }
        
        guard let data = data else{return}
        print("data: \(data)")
        
        do{
            let apiResponse:APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            NotificationCenter.default.post(name: DidReceiveFriendsNotification, object: nil, userInfo: ["friends":apiResponse.results])
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
    }
    
    dataTask.resume()
}
