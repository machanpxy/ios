//
//  secondViewController.swift
//  MultiMVC
//
//  Created by student on 2018/12/6.
//  Copyright © 2018年 2016. All rights reserved.
//

import UIKit
/*protocol studentProtocol {
    func change(name: String,no:String)
}*/

class secondViewController: UIViewController {
 //   func change(name: String, no: String) {
  //      self.name = name
  //      self.no = no
  //  }
  //  var delegate: studentProtocol?
    
   // var name = ""
   // var no = ""
    //
    
    var stu: student!
    
    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tfName.text = stu.name
        tfNo.text = stu.no
       // self.view.backgroundColor = UIColor.yellow
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: UIButton) {
        stu.no = tfNo.text!
        stu.name = tfName.text!
        /*for vc in self.navigationController!.viewControllers {
            if let firstVC = vc as? FirstViewController {
                firstVC.no = no
                firstVC.name = name
            }
        }
 */
       // delegate?.change(name: name, no: no)
navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
