//
//  UIViewControllerExtensions.swift
//  Versi-App
//
//  Created by Mac on 11/24/20.
//

import UIKit
import SafariServices
extension UIViewController{
    func presentSafariVC (url : String){
        var readMe = URL(string : url)!
        var safariVC = SFSafariViewController(url: readMe)
        present(safariVC, animated: true, completion: nil)
        
    }
}
