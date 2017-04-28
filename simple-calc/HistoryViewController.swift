//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by Patricia Au on 4/28/17.
//  Copyright © 2017 Patricia Au. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    @IBOutlet weak var scrollArea: UIScrollView!
    
    var passedArr : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        var h: CGFloat = 50
        var startY: CGFloat = 50
        let labelW = scrollArea.frame.width
        for i in passedArr {
            let label = UILabel(frame: CGRect(x: 0, y:startY, width:labelW, height: h))
            label.text = i
            self.view.addSubview(label)
            h = h + 50
            startY = startY + 50
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func prepare(for seque: UIStoryboardSegue, sender: Any?) {
        let mVC = seque.destination as! ViewController
        mVC.arrFromHis = passedArr
    }


}
