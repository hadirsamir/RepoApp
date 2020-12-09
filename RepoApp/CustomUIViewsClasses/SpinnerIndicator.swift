//
//  SpinnerIndicator.swift
//  Versi-App
//
//  Created by Mac on 11/24/20.
//

import Foundation
import UIKit

class SpinnerIndicator{
       static var spinner: UIActivityIndicatorView? = UIActivityIndicatorView()
    static func startIndicator(view:UIViewController){

        spinner?.translatesAutoresizingMaskIntoConstraints = false
        spinner?.center = view.view.center
        spinner?.hidesWhenStopped = true
        spinner?.style = .whiteLarge
        spinner?.color = .black
        view.view.addSubview(spinner!)
        createConstraints(in: view.view)
        spinner?.startAnimating()
    }
    
    private static func createConstraints(in view: UIView) {
        let centerX = NSLayoutConstraint(item: spinner!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let centerY = NSLayoutConstraint(item: spinner!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        
        view.addConstraints([centerY, centerX])
    }
    
   static func stopIndicator(){
      
        spinner?.stopAnimating()
    }
}
