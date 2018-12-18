//
//  ViewController.swift
//  singel
//
//  Created by student on 2018/10/25.
//  Copyright © 2018年 2016110434. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        class MyView: UIView {
            
            override func draw(_ rect: CGRect) {
                let path = UIBezierPath(ovalIn: rect)
                
                UIColor.red.setStroke()  //红色边界
                path.stroke()
                
                UIColor.yellow.setFill()  //黄色填充
                path.fill()
            }
            
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

