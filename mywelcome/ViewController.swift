//
//  ViewController.swift
//  mywelcome
//
//  Created by  yanglc on 15/12/29.
//  Copyright © 2015年  yanglc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    var scrollview:UIScrollView!
    var pagectrol:UIPageControl!
    
    var button:UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var w = self.view.bounds.width;
        var h = self.view.bounds.height;
        
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        scrollview = UIScrollView();
        scrollview.frame = self.view.frame;
        scrollview.showsHorizontalScrollIndicator = false;
        scrollview.showsVerticalScrollIndicator = false;
        scrollview.pagingEnabled = true;
        scrollview.contentSize = CGSize(width:4 * w, height: h);
        var v1 = UIImageView(image: UIImage(named: "new_feature_1"));
        var v2 = UIImageView(image: UIImage(named: "new_feature_2"))
        var v3 = UIImageView(image: UIImage(named: "new_feature_3"))
        var v4 = UIImageView(image: UIImage(named: "new_feature_4"));
        v1.frame = CGRect(x: 0, y: 0, width: w, height: h);
        v2.frame = CGRect(x: w, y: 0, width: w, height: h)
        v3.frame = CGRect(x: w + w, y: 0, width: w, height: h)
        v4.frame = CGRect(x: w + w + w, y: 0, width: w, height: h);
        
        
        scrollview.bounces = false;
        scrollview.addSubview(v1);
        scrollview.addSubview(v2)
        scrollview.addSubview(v3)
        scrollview.addSubview(v4)
        scrollview.backgroundColor = UIColor.whiteColor()
        scrollview.delegate = self;
        
        
        self.view.addSubview(scrollview)
        
        
        var yy = h - 100;
        var vv = CGRect(x: 0, y: yy, width: w, height: 40);
        pagectrol = UIPageControl(frame: vv)
        
        pagectrol.numberOfPages = 4;
        pagectrol.currentPage = 0;
        pagectrol.pageIndicatorTintColor = UIColor.redColor()
        pagectrol.tintColor = UIColor.blueColor()
        
        self.view.addSubview(pagectrol)
        
        
        
        
        var btw = 100;
        var bth = 44;
        var xx = (Int(w) / 2) - (btw / 2);
        button = UIButton(frame: CGRect(x: xx, y: 400, width: btw, height: bth))
        button?.setTitle("go", forState: .Normal)
        button?.backgroundColor = UIColor.brownColor()

        self.view.addSubview(button!)

        button?.hidden = true;
        
        button?.addTarget(self, action: "gonext", forControlEvents: .TouchUpInside)
        
        
        
        
        
        
        
    }
    func gonext(){
        
      var window  =  UIApplication.sharedApplication().keyWindow;
        
        window?.rootViewController = WelcomeViewController()

    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        var w = scrollview.frame.size.width;
        
        var currentx = scrollview.contentOffset.x + w/2;
        
        var num = Int(currentx / w);
        
        pagectrol.currentPage = num;
        
        
        if(num == 3){
            button?.hidden = false;
        }else{
            button?.hidden = true;
            
        }
        
        
        
    }
    
    
    deinit{
        
        print("viewcontroller 已经被销毁了")
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

