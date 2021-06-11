//
//  PageViewController.swift
//  PageViewController-Sample
//
//  Created by 大西玲音 on 2021/06/11.
//

import UIKit

class PageViewController: UIPageViewController {
    
    private var controllers = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPageViewController()
        
    }
    
    private func setupPageViewController() {
        let firstVC = storyboard?.instantiateViewController(
            withIdentifier: "FirstViewController"
        ) as! FirstViewController
        let secondVC = storyboard?.instantiateViewController(
            withIdentifier: "SecondViewController"
        ) as! SecondViewController
        let thirdVC = storyboard?.instantiateViewController(
            withIdentifier: "ThirdViewController"
        ) as! ThirdViewController
        controllers = [firstVC, secondVC, thirdVC]
        setViewControllers([controllers[0]], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
    }
    
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController),
           index < controllers.count - 1 {
            return controllers[index + 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController),
           index > 0 {
            return controllers[index - 1]
        }
        return nil
    }
    
}
