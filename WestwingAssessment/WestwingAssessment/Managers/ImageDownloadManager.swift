//
//  ImageDownloadManager.swift
//  WestwingAssessment
//
//  Created by Zoltan Csipler on 2016. 04. 25..
//  Copyright © 2016. Westwing. All rights reserved.
//

import UIKit

class ImageDownloadManager: NSObject
{
    static let sharedInstance = ImageDownloadManager()
    
    func downloadImage(url: String, placeHolder: UIImageView)
    {
        let qualityOfServiceClass = QOS_CLASS_BACKGROUND
        let backgroundQueue = dispatch_get_global_queue(qualityOfServiceClass, 0)
        dispatch_async(backgroundQueue,
        {
            NetworkService.sharedInstance.downloadImage(url)
            {
                (result, image) -> Void in
                
                if (result.resultCode == WWResultCode.Success)
                {
                    placeHolder.image = image
                }
            }
        })
    }
}
