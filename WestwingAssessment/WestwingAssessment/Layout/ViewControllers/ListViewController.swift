//
//  ViewController.swift
//  WestwingAssessment
//
//  Created by Zoltan Csipler on 2016. 04. 23..
//  Copyright © 2016. Westwing. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var ProductList: Array<WWProduct>!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.activityIndicator.startAnimating();
        
        ProductService.sharedInstance.getProductList()
        {
            (result, ProductList) -> Void in
            if(result.resultCode == WWResultCode.Success)
            {
                self.activityIndicator.stopAnimating()
                self.ProductList = ProductList
                self.tableView.hidden = false
                self.tableView.reloadData()
            }
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (self.ProductList != nil)
        {
            return self.ProductList.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let Product = self.ProductList![indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductTableViewCell", forIndexPath: indexPath) as! ProductTableViewCell
        cell.lblName.text = Product.name
        cell.lblSubline.text = Product.subline
        
        ImageDownloadManager.sharedInstance.downloadImage(Product.navigationUrl!, placeHolder: cell.imgView)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("detailsViewController") as! DetailsViewController
        destination.Product = self.ProductList![indexPath.row]
        
        navigationController?.pushViewController(destination, animated: true)
    }
}