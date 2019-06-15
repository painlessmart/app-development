//
//  PagerViewCustome.swift
//  TestMain
//
//  Created by Macintosh on 7/11/1397 AP.
//  Copyright © 1397 ali. All rights reserved.
//

import UIKit

@objc public protocol  PagerViewCustomDataSource {
    func setViewsPagerViewCustom(pagerView : PagerViewCustom) -> [UIViewController]
    @objc optional func didSelectedItem(index:Int)
    @objc optional func didChangePage(index:Int)
}

public class PagerViewCustom: UIView  {
    var currentIndex = 0
    var pagerView = UIPageViewController()
    var transitionStyle : UIPageViewController.TransitionStyle = .scroll
    
    var dataSource:PagerViewCustomDataSource? = nil {
        didSet {
            reloadData()
        }
    }
    
    fileprivate lazy var pages: [UIViewController] = {
        return []
    }()
    
    func reloadData()  {
        pages = {
            let views = (dataSource?.setViewsPagerViewCustom(pagerView: self))!
            for view in views.enumerated() {
                view.element.view.tag = view.offset
            }
            return views
            
        }()
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    
    func setupView(){
        self.pagerView = UIPageViewController(transitionStyle: self.transitionStyle , navigationOrientation: .horizontal, options: nil)
        pagerView.view.frame = self.bounds
        self.addSubview(pagerView.view)
        pagerView.dataSource = self
        pagerView.delegate   = self
        if let firstVC = pages.first
        {
            pagerView.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func selectItemAtIndex(index : Int )  {
        if index > pagerView.viewControllers!.first!.view.tag {
            pagerView.setViewControllers([pages[index]], direction: .forward , animated: true, completion: nil)
        }else{
            pagerView.setViewControllers([pages[index]], direction: .reverse , animated: true, completion: nil)
        }
        
    }
    

}

extension PagerViewCustom : UIPageViewControllerDataSource{
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0          else { return nil }
        
        guard pages.count > previousIndex else { return nil        }
        
        return pages[previousIndex]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pages.count else { return nil }
        
        guard pages.count > nextIndex else { return nil }
        
        return pages[nextIndex]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else { return }
        dataSource?.didChangePage!(index: pageViewController.viewControllers!.first!.view.tag)
        self.currentIndex = pageViewController.viewControllers!.first!.view.tag
    }
}

extension PagerViewCustom: UIPageViewControllerDelegate { }



