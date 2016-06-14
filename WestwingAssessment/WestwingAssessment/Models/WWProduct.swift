//
//  WWProduct.swift
//  WestwingAssessment
//
//  Created by Zoltan Csipler on 2016. 04. 23..
//  Copyright © 2016. Westwing. All rights reserved.
//

import Gloss

class WWProduct: Decodable
{
    let startTimeFormatted: String?
    let newsletterUrlkey: String?
    let subline: String?
    let videos: [AnyObject]?
    let name: String?
    let images: [AnyObject]?
    let urlKey: String?
    let bannerUrlOriginal: String?
    let startTime: String?
    let messageLineStyle: String?
    let promotionLine: String?
    let themeday: String?
    let endTimeFormatted: String?
    let remainingDaysFormatted: String?
    let navigationUrl: String?
    let messageLine: String?
    let bannerUrl: String?
    let badgeUrl: String?
    let endTime: String?
    let idCampaign: String?
    let description: String?
    
    required init?(json: JSON)
    {
        self.startTimeFormatted = "start_time_formatted" <~~ json
        self.newsletterUrlkey = "newsletter_urlkey" <~~ json
        self.subline = "subline" <~~ json
        self.videos = "videos" <~~ json
        self.name = "name" <~~ json
        self.images = "images" <~~ json
        self.urlKey = "url_key" <~~ json
        self.bannerUrlOriginal = "banner_url_original" <~~ json
        self.startTime = "start_time" <~~ json
        self.messageLineStyle = "message_line_style" <~~ json
        self.promotionLine = "promotion_line" <~~ json
        self.themeday = "themeday" <~~ json
        self.endTimeFormatted = "end_time_formatted" <~~ json
        self.remainingDaysFormatted = "remaining_days_formatted" <~~ json
        self.navigationUrl = "navigation_url" <~~ json
        self.messageLine = "message_line" <~~ json
        self.bannerUrl = "banner_url" <~~ json
        self.badgeUrl = "badge_url" <~~ json
        self.endTime = "end_time" <~~ json
        self.idCampaign = "id_campaign" <~~ json
        self.description = "description" <~~ json
    }
}
