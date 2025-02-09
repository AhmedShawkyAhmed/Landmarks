//
//  PageViewController.swift
//  Landmarks
//
//  Created by Ahmed Shawky on 09/02/2025.
//

import SwiftUI
import UIKit

struct PageViewController<page: View>: UIViewControllerRepresentable {
    var pages: [page]
    @Binding var currentPage: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator


        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
            pageViewController.setViewControllers(
                [context.coordinator.controllers[currentPage]],
                direction: .forward,
                animated: true
            )
        }

    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map {UIHostingController(rootView: $0)}
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController
        ) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            if index == 0 { return nil }
            return controllers[index - 1]
        }
    
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController
        ) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            if index == controllers.count - 1 { return nil }
            return controllers[index + 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
                if completed,
                   let visiableViewController = pageViewController.viewControllers?.first,
                   let index = controllers.firstIndex(of: visiableViewController) {
                    parent.currentPage = index
                }
            }
    }
}
