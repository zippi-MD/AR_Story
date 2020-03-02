//
//  BookView.swift
//  AR_Story
//
//  Created by Alejandro Mendoza on 02/03/20.
//  Copyright © 2020 Alejandro Mendoza. All rights reserved.
//

import UIKit

class BookView: UIView {
    @IBOutlet var containerView: UIView!
    
    private var pageController: UIPageViewController?
    private(set) var currentPage: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
        let bundle = Bundle(for: BookView.self)
        bundle.loadNibNamed(String(describing: BookView.self), owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        setupPageController()
    }
    
    private func setupPageController() {
        pageController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        pageController?.delegate = self
        pageController?.dataSource = self
        
        pageController?.view.backgroundColor = .brown
        pageController?.view.frame = containerView.frame
        
        guard let pageControllerView = pageController?.view else { return }
        
        addSubview(pageControllerView)
        let initialVC = UIViewController()
        initialVC.view.backgroundColor = .red
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .green
        pageController?.isDoubleSided = true
        pageController?.setViewControllers([initialVC], direction: .forward, animated: true, completion: nil)
        
    }
    
}

extension BookView: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.red
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.blue
        return vc
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    
    
}

extension BookView: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewController.SpineLocation {
         
        return .max
        
    }
}
