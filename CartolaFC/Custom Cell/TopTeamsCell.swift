//
//  TopTeamsCell.swift
//  CartolaFC
//
//  Created by Marcelo on 12/15/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit

class TopTeamsCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var badge: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
