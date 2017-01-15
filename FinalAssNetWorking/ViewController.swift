//
//  ViewController.swift
//  FinalAssNetWorking
//
//  Created by mac on 2017/1/12.
//  Copyright © 2017年 VictorBasic. All rights reserved.
//
//


import UIKit

class ViewController: UIViewController {

    @IBAction func getMethod(_ sender: Any) {
        
        
         let url = URL(string: "https://httpbin.org/get")
         var request = URLRequest(url: url!)
         request.httpMethod = "GET"
         
         //        let postString = "name=peter&score=90"
         //
         //        let postData = postString.data(using: String.Encoding.utf8)
         //        request.httpBody = postData
         
         let task = URLSession.shared.dataTask(with: request) {
         (returnData: Data?, response: URLResponse?, error: Error?) in
         
         if let data = returnData {
         do {
         let json = try JSONSerialization.jsonObject(with: data) as! [String: AnyObject]
            let origin = json["origin"]
            print(origin)
//         print(json)
         } catch {
         
         }
         }
         }
         
         task.resume()
         
         
         
         
         
 
    }
    
    
    //https://httpbin.org/post
    
    // {“time”: “2016-07-1512:00:00”}
    @IBAction func postMethod(_ sender: Any) {
        
        let calendar = Calendar.current

        let url = URL(string: "https://httpbin.org/post")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //{“time”: “2016-07-15 12:00:00”}
  
        let postDictionary = ["time": "2016-07-15 12:00:00"]
//        let postDictionary = [["name": "peter", "score": "90"],
//                              ["name": "shawn", "score": "95"]]
//        let dateComponents = DateComponents(year: 2016, month: 7, day: 15, hour: 12, minute: 0, second: 0 )
        let timeIhave = Date() //dateComponents
        print(timeIhave)
        
        do {
            let postData = try JSONSerialization.data(withJSONObject: postDictionary, options: [])
            
            let task = URLSession.shared.uploadTask(with: request, from: postData) {
                (returnData:Data?, res:URLResponse?, err:Error?) -> Void in
                if let returnData = returnData {
                    do {
                        let dic = try JSONSerialization.jsonObject(with: returnData) as! [String: AnyObject]
                        

//                        let date = Date()
//                        let calendar = Calendar.current
//
//                        let unitFlags: NSCalendar.Unit = [.hour, .day, .month, .year]
//                        let components = calendar.component(Calendar.Component, from: date)
//                        let timeIGot = calendar.date(from: timeInDown)
                        let timeInDown = Date()
                        print(timeInDown)
 //                       print(dic)
//                        let components = calendar.dateComponents([.year, .month, .day], from: timeIhave!, to: timeInDown!)
                        let spendTime = timeInDown.timeIntervalSince(timeIhave)
                        print("花了\(spendTime)秒")
//                        let components = calendar.dateComponents([.year, .month, .day, .minute, .second, .nanosecond], from: timeIhave!, to: timeInDown!)

                    } catch {
                        
                    }
                }
                
            }
            
            task.resume()
        } catch {
            
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

