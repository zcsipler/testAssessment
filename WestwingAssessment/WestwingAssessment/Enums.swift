//
//  Enums.swift
//  WestwingAssessment
//
//  Created by Zoltan Csipler on 2016. 04. 24..
//  Copyright © 2016. Westwing. All rights reserved.
//

import Foundation

enum WWResultCode: Int
{
    case Success = 0
    case NetworkError = 1
    case ParsingError = 2
    case ApiError = 3
    case UnkownError = 4
};

enum WWMessage: String
{
    case NetworkError = "Network Error!"
    case ParsingError = "Error during parsing JSON!"
    case UnknownError = "Unknown Error occured!"
};

enum WWServiceUrl: String
{
    case ProductListUrl = "http://static.westwing.de/cms/dont-delete/programming_task/data.json"
};