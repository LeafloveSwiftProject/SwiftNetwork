//
//  Swiftnet.swift
//  NetWork
//
//  Created by wanfengxixi on 2021/12/10.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif


func getOrignNet(){
    //请求URL
    let url:NSURL! = NSURL(string: "https://api.yonyoucloud.com/apis/dst/collegeInfoQuery/collegeInfoQuery")
    let request:NSMutableURLRequest = NSMutableURLRequest(url: url as URL)
    let list  = NSMutableArray()
    let paramDic = [String: String]()
    
    if paramDic.count > 0 {
        //设置为GET请求
        request.httpMethod = "GET"
        //拆分字典,subDic是其中一项，将key与value变成字符串
        for subDic in paramDic {
            let tmpStr = "\(subDic.0)=\(subDic.1)"
            list.add(tmpStr)
        }
        //用&拼接变成字符串的字典各项
        let paramStr = list.componentsJoined(by:"&")
        //UTF8转码，防止汉字符号引起的非法网址
        let paraData = paramStr.data(using: .utf8)
        //设置请求体
        request.httpBody = paraData
    }
    //默认session配置
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    //发起请求
    let dataTask = session.dataTask(with: request as URLRequest) { data, response, error in
        
      
        print(data.hashValue as Any)
        
        
    }

    dataTask.resume()
    
}

func getNet2(){

    let semaphore = DispatchSemaphore (value: 0)

    var request = URLRequest(url: URL(string: "https://learning.postman.com/docs/getting-started/introduction/")!,timeoutInterval: Double.infinity)
    request.httpMethod = "GET"

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        semaphore.signal()
        return
      }
      print(String(data: data, encoding: .utf8)!)
      semaphore.signal()
    }

    task.resume()
    semaphore.wait()

}

func postOrignNet(){
    //请求URL
    var semaphore = DispatchSemaphore (value: 0)
    var request = URLRequest(url: URL(string: "https://learning.postman.com/docs/getting-started/introduction/")!,timeoutInterval: Double.infinity)
    request.httpMethod = "POST"

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        semaphore.signal()
        return
      }
      print(String(data: data, encoding: .utf8)!)
      semaphore.signal()
    }

    task.resume()
    semaphore.wait()

    
}
