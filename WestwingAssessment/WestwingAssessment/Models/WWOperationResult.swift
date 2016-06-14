//
//  WWOperationResult.swift
//  WestwingAssessment
//
//  Created by Zoltan Csipler on 2016. 04. 24..
//  Copyright © 2016. Westwing. All rights reserved.
//

class WWOperationResult
{
    var resultCode: WWResultCode
    var resultMessage: String = ""
    
    init(resultCode: WWResultCode)
    {
        self.resultCode = resultCode;
    }
    
    init(resultCode: WWResultCode, resultMessage:String)
    {
        self.resultCode = resultCode;
        self.resultMessage = resultMessage;
    }
}

