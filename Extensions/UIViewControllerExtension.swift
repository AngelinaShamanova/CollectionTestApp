//
//  UIViewControllerExtension.swift
//  AdApp
//
//  Created by Angelina on 03.01.2021.
//

import UIKit

fileprivate var someView: UIView?

extension UIViewController {
    
    func showSpinner() {
        someView = UIView(frame: self.view.bounds)
        someView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let activity = UIActivityIndicatorView(style: .medium)
        activity.center = someView?.center ?? CGPoint()
        activity.startAnimating()
        someView?.addSubview(activity)
        self.view.addSubview(someView ?? UIView())
    }
    
    func removeSpinner() {
        someView?.removeFromSuperview()
        someView = nil
    }
}
