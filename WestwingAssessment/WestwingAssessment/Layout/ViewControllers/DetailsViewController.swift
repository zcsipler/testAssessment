//
//  DetailsViewController.swift
//  WestwingAssessment
//
//  Created by Zoltan Csipler on 2016. 04. 25..
//  Copyright © 2016. Westwing. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController
{
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSubline: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblStartTime: UILabel!
    @IBOutlet weak var lblNavigationUrl: UILabel!
    
    var Product: WWProduct!
    
    override func viewDidLoad()
    {
        ImageDownloadManager.sharedInstance.downloadImage(self.Product.navigationUrl!, placeHolder: self.imgView)
        
        self.lblName.text = Product.name
        self.lblSubline.text = Product.subline
        self.lblDescription.text = Product.description
        self.lblStartTime.text = Product.startTimeFormatted
        self.lblNavigationUrl.text = Product.navigationUrl
    }
}
