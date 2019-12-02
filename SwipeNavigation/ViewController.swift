//
//  ViewController.swift
//  SwipeNavigation
//
//  Created by Ahad Sheriff on 6/24/16.
//  Copyright © 2016 Ahad Sheriff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var sessionViewController: UIViewController!
    var statsViewController: UIViewController!
    let countdownCircle1 = CAShapeLayer()
    let circleCountdownAnimation = CABasicAnimation(keyPath: "strokeEnd")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("in view")
        print(view.center)
        setupLayout()
    }
    
    private func setupLayout() {
        
        /// Set up views
        sessionViewController = storyboard!.instantiateViewController(withIdentifier: "session") as? SessionViewController
//        sessionViewController.view.bounds = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
//        sessionViewController.view.center = view.center
//        sessionViewController.size(forChildContentContainer: self, withParentContainerSize: CGSize(width: view.bounds.width, height: view.bounds.height))
        self.addChild(sessionViewController)
        self.scrollView.addSubview(sessionViewController.view!)
        sessionViewController.didMove(toParent: self)

        statsViewController = storyboard!.instantiateViewController(withIdentifier: "stats") as? StatsViewController
        var resultsFrame = statsViewController.view.frame
        resultsFrame.origin.x = self.view.frame.size.width
        statsViewController.view.frame = resultsFrame
        self.addChild(statsViewController)
        self.scrollView.addSubview(statsViewController.view!)
        statsViewController.didMove(toParent: self)

        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width * 2, height: self.view.frame.size.height)
        
        /// Set up circle
        let circularPath = UIBezierPath(arcCenter: view.center,
                                        radius: 117,
                                        startAngle: (3 * CGFloat.pi) / 2,
                                        endAngle: -CGFloat.pi / 2,
                                        clockwise: false)

        countdownCircle1.path = circularPath.cgPath
        countdownCircle1.strokeColor = UIColor.label.cgColor
        countdownCircle1.fillColor = UIColor.clear.cgColor
        countdownCircle1.lineWidth = 1
        countdownCircle1.strokeEnd = 1

        sessionViewController.view.layer.addSublayer(countdownCircle1)
    }
}

