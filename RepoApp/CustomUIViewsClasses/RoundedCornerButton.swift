//
//  RoundedCornerButton.swift
//  Versi-App
//
//  Created by Mac on 11/19/20.
//

import UIKit

class RoundedCornerButton: UIButton {
    override init(frame: CGRect) {
           super.init(frame: frame)
           setup()
         }
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setup()
          }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
     func setup() {
        self.layer.cornerRadius = frame.height / 2
           self.layer.masksToBounds = true
        self.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        self.layer.borderWidth = 3
        self.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
         }
}
