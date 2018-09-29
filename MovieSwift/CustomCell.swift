//
//  CustomCell.swift
//  MovieSwift
//
//  Created by Arun Kumar on 9/27/18.
//  Copyright © 2018 Arun Kumar. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl : UILabel!
    @IBOutlet weak var popularityLbl : UILabel!
    @IBOutlet weak var releaseDateLbl : UILabel!
    @IBOutlet weak var posterImgView : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLbl.backgroundColor = UIColor.yellow
    }
}
