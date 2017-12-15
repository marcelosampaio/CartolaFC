//
//  MatchesCell.swift
//  CartolaFC
//
//  Created by Marcelo on 12/15/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit

class MatchesCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var badge1: UIImageView!
    
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var badge2: UIImageView!
    
    @IBOutlet weak var dateTime: UILabel!
    @IBOutlet weak var stadium: UILabel!
    
    
    // MARK: - Cell
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
