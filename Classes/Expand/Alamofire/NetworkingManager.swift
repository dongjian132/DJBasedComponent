//
//  NetworkingManager.swift
//  MeterReadingSystem
//
//  Created by 董剑 on 2021/12/9.
//  Copyright © 2021 董剑. All rights reserved.
//

import Foundation
import Alamofire
import SwiftUI
import Result
import Moya

private class MRUUID {
    fileprivate static var value: String! {
        let ref = CFUUIDCreate(kCFAllocatorDefault)
        guard let uuid = CFUUIDCreateString(kCFAllocatorDefault, ref) as String? else { return nil }
        return uuid.replacingOccurrences(of: "-", with: "")
    }
}

public class NetworkingManager :NSObject {
    
    var success:(([String:AnyObject])->())!
    var failure:((String)->())!
    private override init(){}
    public static let shared = NetworkingManager()
    private let msgNetError = "网络错误，请联网后点击重试"
    private let msgDataError = "获取网络数据失败"
    private let reachabilityManager = NetworkReachabilityManager()
    var system_name: String = UIDevice.current.systemName
    var system_version: String = UIDevice.current.systemVersion
    var app_version: String = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    var app_name: String = Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String
    var build_version: String = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    var UUID: String = MRUUID.value
    
    private var headers: HTTPHeaders {
        get {
            let headers:HTTPHeaders = [
                "system_name": system_name,
                "system_version": system_version,
                "app_version": app_version,
                "app_name": app_name,
                "build_version": build_version,
                "UUID": UUID,
            ]
            return headers
        }
    }
    
    enum HTTPResultType {
        case success
        case failure
        case noNetWork
        case error
    }
    
    typealias requestBack = (_ type: HTTPResultType, _ response: Any?, _ message: String) -> ()
    
    //数据处理
    func responseData(response: DataResponse<Any>,
                      finished: @escaping requestBack) {
        
        println("返回数据信息：\(response)")
        guard let result = response.value else {
            finished(.error, nil, msgDataError)
            return
        }
        
        let msg = ((response.result.value as? [String:Any])?["mag"] as? String) ?? ""
        let code = ((response.result.value as? [String: Any])?["code"] as? NSNumber)?.intValue ?? -1
        switch code {
        case 1: //成功
            finished(.success, result, msg)
        case -1://重新登录
            finished(.failure, result, msg)
        case 2:
            finished(.success, result, msg)
        default:
            print("未知code:\(code)")
            finished(.failure, result, msg)
        }
    }
    
    /**
     *  网络请求  get / post
     *  url: 网络连接 url
     *  parameters: 参数  [String: String]
     */
    func request(url:String,
                 method:HTTPMethod,
                 parameters:[String:String],
                 finished:@escaping requestBack) {
        if reachabilityManager?.isReachable == false {
            finished(HTTPResultType.noNetWork,
                     nil,
                     msgNetError)
        }
        Alamofire.request(url,
                          method: method,
                          parameters: parameters,
                          encoding: URLEncoding.default,
                          headers: headers).responseJSON { (response) in
            if(response.error == nil) {
                self.responseData(response: response, finished: finished)
            }else {
                println("请求失败\(String(describing: response.error))")
            }
        }
    }
    
    /**
     * 上传多张图片  带参数
     *  url: 网络连接 url
     *  parameters: 参数  [String: String]
     *  imgArr: 参数  [(Data, String)]
     */
    func uploadImages(url: String,
                      parameters: [String: String] = [:],
                      imgArr: [(Data, String)],
                      finished:@escaping requestBack) {
        if reachabilityManager?.isReachable == false {
            finished(HTTPResultType.noNetWork,
                     nil,
                     msgNetError)
        }
        Alamofire.upload(multipartFormData: { (formdata) in
            for index in 0..<imgArr.count {
                let  imageData = imgArr[index]
                if imageData.1 == "GIF" {
                    formdata.append(imageData.0, withName: "file[\(index)]", fileName: "file[\(index)].gif", mimeType: "image/gif")
                } else {
                    formdata.append(imageData.0, withName: "file[\(index)]", fileName: "file[\(index)].jpg", mimeType: "image/png,image/jpeg,image/jpg")
                }
            }
        },to: "",headers: headers) {(encodingResult) in
            switch encodingResult {
            case .success(let uploadFile, _, _):
                //上传进度回调
                uploadFile.uploadProgress(closure: { (progress) in
                    println("上传进度\(progress)")
                })
                //上传结果回调
                uploadFile.responseString(completionHandler: { (response) in
                    println(response.result.value!)
                    //self.responseData(response: (response as! DataResponse<Any>), finished: finished)
                })
                break
            case .failure(let error):
                println(error);
                break
            }
        }
    }
}
