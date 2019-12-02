//
//  SessionViewController.swift
//  SwipeNavigation
//
//  Created by Grady Woodruff on 12/1/19.
//  Copyright © 2019 Ahad Sheriff. All rights reserved.
//

import UIKit

class SessionViewController: UIViewController {
    let countdownCircle1 = CAShapeLayer()
    let circleCountdownAnimation = CABasicAnimation(keyPath: "strokeEnd")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("in session view")
        print(view.center)
        let circularPath = UIBezierPath(arcCenter: self.view.center,
                                        radius: 117,
                                        startAngle: (3 * CGFloat.pi) / 2,
                                        endAngle: -CGFloat.pi / 2,
                                        clockwise: false)
        
        countdownCircle1.path = circularPath.cgPath
        countdownCircle1.strokeColor = UIColor.label.cgColor
        countdownCircle1.fillColor = UIColor.clear.cgColor
        countdownCircle1.lineWidth = 1
        countdownCircle1.strokeEnd = 1
        
        view.layer.addSublayer(countdownCircle1)
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
