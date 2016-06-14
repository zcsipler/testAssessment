//
//  NetworkService.swift
//  WestwingAssessment
//
//  Created by Zoltan Csipler on 2016. 04. 24..
//  Copyright © 2016. Westwing. All rights reserved.
//

import UIKit

class NetworkService
{
    static let sharedInstance = NetworkService()
    
    func callRequest(serviceUrl: String, completionHandler: (WWOperationResult, AnyObject?) -> Void)
    {
        let requestURL: NSURL = NSURL(string: serviceUrl)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(urlRequest)
        {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            dispatch_async(dispatch_get_main_queue(),
            {
                if (statusCode == 200)
                {
                    do
                    {
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                        completionHandler(WWOperationResult(resultCode: WWResultCode.Success), json)
                    }
                    catch
                    {
                        completionHandler(WWOperationResult(resultCode: WWResultCode.ParsingError, resultMessage: WWMessage.ParsingError.rawValue), nil)
                    }
                }
                else
                {
                    completionHandler(WWOperationResult(resultCode: WWResultCode.NetworkError, resultMessage: WWMessage.NetworkError.rawValue), nil)
                }
            })
        }
        task.resume();
    }
    
    func downloadImage(serviceUrl: String, completionHandler: (WWOperationResult, UIImage?) -> Void)
    {
        let requestURL: NSURL = NSURL(string: serviceUrl)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue())
        {
            (response ,data ,error) -> Void in
            if error == nil
            {
                let httpResponse = response as! NSHTTPURLResponse
                let statusCode = httpResponse.statusCode
                
                if (statusCode == 200)
                {
                    let image = UIImage(data: data!)
                    dispatch_async(dispatch_get_main_queue(),
                    {
                        completionHandler(WWOperationResult(resultCode: WWResultCode.Success), image)
                    })

                    
                }
                else
                {
                    dispatch_async(dispatch_get_main_queue(),
                    {
                        completionHandler(WWOperationResult(resultCode: WWResultCode.NetworkError, resultMessage: WWMessage.NetworkError.rawValue), nil)
                    })
                   
                }
            }
        }
    }
}