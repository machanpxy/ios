//
//  ViewController.swift
//  MultiMVC
//
//  Created by student on 2018/12/6.
//  Copyright © 2018年 2016. All rights reserved.
//

import UIKit

class FristViewController: UIViewController {

    //var name = ""
   // var no = ""
    var stu = student()
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfNo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        tfName.text = stu.name
        tfNo.text = stu.no
    }
    @IBAction func showSecond(_ sender: Any) {
        stu.no = tfNo.text!
        stu.name = tfName.text!
        let secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondVC") as!secondViewController
        secVC.stu = stu
         //   secVC.no = stu.no
           // secVC.name = stu.name
            //secVC.delegate = self
        self.navigationController?.pushViewController(secVC, animated: true)
    }
    
    @IBAction func showThird(_ sender: Any) {
        let thirVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "thirdVC")
        present(thirVC, animated: true, completion: nil )
    }
}
