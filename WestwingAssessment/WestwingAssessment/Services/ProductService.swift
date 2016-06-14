//
//  ProductService.swift
//  WestwingAssessment
//
//  Created by Zoltan Csipler on 2016. 04. 24..
//  Copyright © 2016. Westwing. All rights reserved.
//

import UIKit
import Gloss

class ProductService: NSObject
{
    static let sharedInstance = ProductService()
    
    func getProductList(completionHandler: (WWOperationResult, Array<WWProduct>?) -> Void)
    {
        NetworkService.sharedInstance.callRequest(WWServiceUrl.ProductListUrl.rawValue)
        {
            (result, json) -> Void in
            
            if (result.resultCode == WWResultCode.Success)
            {
                let ProductList = [WWProduct].fromJSONArray(json as! [JSON]);
                completionHandler(WWOperationResult(resultCode: WWResultCode.Success), ProductList)
            }
            else
            {
                completionHandler(WWOperationResult(resultCode: WWResultCode.Success), nil)
            }
        }
    }
}
