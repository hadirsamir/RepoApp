//
//  RoundedCornerTextField.swift
//  Versi-App
//
//  Created by Mac on 11/19/20.
//

import UIKit

class RoundedCornerTextField: UITextField {
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
        let placeHolder = NSAttributedString(string: self.placeholder!, attributes:  [NSAttributedString.Key.foregroundColor: UIColor.systemBlue])
        attributedPlaceholder = placeHolder
        self.layer.cornerRadius = frame.height / 2
        self.layer.masksToBounds = true
        self.layer.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        self.layer.borderWidth = 3
        self.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
         }
    

}
