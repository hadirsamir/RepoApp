//
//  SearchTableViewCell.swift
//  Versi-App
//
//  Created by Mac on 11/24/20.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var searchImage : UIImageView!
    @IBOutlet weak var repoName : UILabel!
    @IBOutlet weak var repoDescription : UILabel!
    @IBOutlet weak var languageLabel : UILabel!
    @IBOutlet weak var forkLabel : UILabel!
    @IBOutlet weak var backGroundView  : UIView!
    public private (set) var  repoUrl : String?

    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        backGroundView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
