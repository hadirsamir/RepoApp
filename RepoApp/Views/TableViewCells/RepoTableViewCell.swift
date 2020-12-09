//
//  RepoTableViewCell.swift
//  Versi-App
//
//  Created by Mac on 11/20/20.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    @IBOutlet weak var repoImage : UIImageView!
    @IBOutlet weak var repoOwnersName : UILabel!
    @IBOutlet weak var repoName : UILabel!
    @IBOutlet weak var dateLabel : UILabel!
    @IBOutlet weak var cellBackGroundView : UIView!
    @IBOutlet weak var readMeBtn : RoundedCornerButton!
    public private (set) var repoUrl: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configCell(object:ItemsResponseModel ){
        repoUrl = object.owner.html_url
        repoName.text = object.name
        repoOwnersName.text = object.owner.login
        dateLabel.text = object.created_at
        repoImage.downloaded(from: object.owner.avatar_url)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        cellBackGroundView.layer.cornerRadius = 15
        cellBackGroundView.layer.shadowColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        cellBackGroundView.layer.shadowRadius = 5.0
        cellBackGroundView.layer.shadowOpacity = 0.25
        cellBackGroundView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
