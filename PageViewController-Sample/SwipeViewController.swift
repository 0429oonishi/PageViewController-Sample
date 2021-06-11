//
//  SwipeViewController.swift
//  PageViewController-Sample
//
//  Created by 大西玲音 on 2021/06/11.
//

import UIKit

class SwipeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftSwipeGR = UISwipeGestureRecognizer(target: self, action: #selector(didSwiped))
        let rightSwipeGR = UISwipeGestureRecognizer(target: self, action: #selector(didSwiped))
        leftSwipeGR.direction = .left
        rightSwipeGR.direction = .right
        self.view.addGestureRecognizer(leftSwipeGR)
        self.view.addGestureRecognizer(rightSwipeGR)
        
    }
    
    @objc private func didSwiped(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
            case .left:
                let firstVC = storyboard?.instantiateViewController(
                    withIdentifier: "FirstViewController"
                ) as! FirstViewController
                self.navigationController?.pushViewController(firstVC, animated: true)
            case .right:
                let secondVC = storyboard?.instantiateViewController(
                    withIdentifier: "SecondViewController"
                ) as! SecondViewController
                let transition = CATransition()
                transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
                transition.type = .push
                transition.subtype = .fromLeft
                self.navigationController!.view.layer.add(transition, forKey: nil)
                self.navigationController?.pushViewController(secondVC, animated: true )
            default:
                break
        }
        
    }
    
}
