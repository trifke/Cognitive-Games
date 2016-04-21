//
//  TutorialViewController.swift
//  CognitiveGames
//
//  Created by Apple on 4/21/16.
//  Copyright © 2016 Chaotic Neutral. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate
{

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var pageImages = []
    
    var pageViews = [AnyObject]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadImages([UIImage(named: "Sort1_framed")!, UIImage(named: "Sort2_framed")!, UIImage(named: "Sort3_framed")!])
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadImages(arrayImages : [UIImage])
    {
        if (arrayImages.count > 0)
        {
            // 1
            pageImages = arrayImages
            let pageCount = arrayImages.count;
    
            // 2
            pageControl.currentPage = 0;
            pageControl.numberOfPages = pageCount;
    
            // 3
            pageViews = [];
            for _ in 0 ..< pageCount
            {
                pageViews.append(NSNull)
            }
    
            // 4
            UIView.animateWithDuration(0.1, animations: { }, completion: { (finished: Bool) in
                let pageScrollViewSize = self.scrollView.frame.size
                self.scrollView.contentSize = CGSize(width: pageScrollViewSize.width * CGFloat(self.pageImages.count), height: pageScrollViewSize.height)
                
                // 5
                self.loadVisablePages()
            })
        }
        else
        {
            let label = UILabel(frame: view.frame)
            label.text = "No images available";
            label.textAlignment = .Center;
            
            view.addSubview(label)
            pageControl.removeFromSuperview()
        }
    }
    
    func loadPage(page : Int)
    {
        if (page < 0 || page >= self.pageImages.count)
        {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
    
        // 1
        if pageViews[page] is UIImageView
        {
            // Do nothing. The view is already loaded.
        }
        else
        {
            // 2
            var frame = scrollView.bounds;
            frame.origin.x = frame.size.width * CGFloat(page);
            frame.origin.y = 0.0;
            
            // 3
            let newPageView = UIImageView(image: pageImages[page] as? UIImage)
            newPageView.contentMode = .ScaleAspectFill;
            newPageView.frame = frame;
            newPageView.tag = page;
            
            scrollView.addSubview(newPageView)
            
            // 4
            pageViews[page] = newPageView;
        }
    }
    
    func purgePage(page : Int)
    {
        if (page < 0 || page >= self.pageImages.count)
        {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
    
        // Remove a page from the scroll view and reset the container array
        if let pageView = pageViews[page] as? UIImageView
        {
            pageView.removeFromSuperview()
            pageViews[page] = NSNull()
        }
    }
    
    func loadVisablePages()
    {
        // First, determine which page is currently visible
        let pageWidth = scrollView.frame.size.width;
        let page = floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0));
    
        // Update the page control
        pageControl.currentPage = Int(page)
    
        // Work out which pages you want to load
        let firstPage = page - 1;
        let lastPage = page + 1;
    
        // Purge anything before the first page
        if firstPage >= 0
        {
            for i in 0 ..< Int(firstPage)
            {
                purgePage(i)
            }
        }
    
        // Load pages in our range
        for i in Int(firstPage) ..< Int(lastPage)
        {
            loadPage(i)
        }
    
        // Purge anything after the last page
        if Int(lastPage) + 1 <= pageImages.count
        {
            for i in Int(lastPage) + 1 ..< pageImages.count
            {
                purgePage(i)
            }
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        loadVisablePages()
    }
}
