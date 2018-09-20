//
//  ViewController.swift
//  NavigationControllerQuestion
//
//  Created by user on 2018/09/19.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit

// 干支詳細画面
class ViewController: UIViewController {

    var item:Item? = nil
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = item?.name
        self.label.text = item?.reading
        self.imageView.image = item?.image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

