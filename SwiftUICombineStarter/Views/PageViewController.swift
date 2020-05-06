//
//  PageViewController.swift
//  SwiftUICombineStarter
//
//  Created by Khasnobis, Pritha on 06/05/20.
//  Copyright © 2020 Deloitte. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct PageViewController: UIViewControllerRepresentable {
    
    func makeCoordinator() -> PageViewController.Coordinator {
        return Coordinator(self)
    }
    
    
    var viewControllers: [UIViewController]
    var pageIndex: Int
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PageViewController>) -> UIPageViewController {
        
        let pageviewComtroller = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageviewComtroller.dataSource = context.coordinator
        pageviewComtroller.delegate = context.coordinator
        return pageviewComtroller
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: UIViewControllerRepresentableContext<PageViewController>) {
        
        uiViewController.setViewControllers([viewControllers[pageIndex]],
                                            direction: .forward, animated: true)
    }
    
    typealias UIViewControllerType = UIPageViewController
    
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
            
            var parent: PageViewController

            init(_ pageViewController: PageViewController) {
                self.parent = pageViewController
            }
            
            func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
                //retrieves the index of the currently displayed view controller
                guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                     return nil
                 }
                
                //shows the last view controller when the user swipes back from the first view controller
                if index == 0 {
                    return parent.viewControllers.last
                }
     
                //show the view controller before the currently displayed view controller
                return parent.viewControllers[index - 1]
            }
            
            func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
                //retrieves the index of the currently displayed view controller
                guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                    return nil
                }
                //shows the first view controller when the user swipes further from the last view controller
                if index + 1 == parent.viewControllers.count {
                    return parent.viewControllers.first
                }
                //show the view controller after the currently displayed view controller
                return parent.viewControllers[index + 1]
            }
            
            func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
                if completed,
                    let visibleViewController = pageViewController.viewControllers?.first,
                    let index = parent.viewControllers.firstIndex(of: visibleViewController) {
                    parent.pageIndex = index
                }
            }
        }
    }
