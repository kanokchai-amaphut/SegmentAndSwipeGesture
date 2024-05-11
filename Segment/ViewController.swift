//
//  ViewController.swift
//  Segment
//
//  Created by Kanokchai Amaphut on 9/5/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var segment: UISegmentedControl!
    let secondVC = SecondViewController()
    let thirdVC = ThirdViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setup()
    }
    
    private func setup() {
        
        addChild(secondVC)
        addChild(thirdVC)
        self.view.addSubview(secondVC.view)
        self.view.addSubview(thirdVC.view)
        
        secondVC.didMove(toParent: self)
        thirdVC.didMove(toParent: self)
        thirdVC.view.isHidden = true
        
        secondVC.view.frame = self.view.bounds
        thirdVC.view.frame = self.view.bounds
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @IBAction func didTapSegment(segment: UISegmentedControl) {
        setupSegment()
        
    }
    
    @objc func swipeFunc(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            segment.selectedSegmentIndex = 0
        } else {
            segment.selectedSegmentIndex = 1
        }
        setupSegment()
    }
    
    private func setupSegment() {
        secondVC.view.isHidden = true
        thirdVC.view.isHidden = true
        if segment.selectedSegmentIndex == 0 {
            secondVC.view.isHidden = false
        } else {
            thirdVC.view.isHidden = false
        }
    }

}

