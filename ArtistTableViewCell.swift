//
//  ArtistTableViewCell.swift
//  InfoSysInterview
//
//  Created by Neha Singh on 19/04/20.
//  Copyright © 2020 Neha Singh. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblArtist: UILabel!
    @IBOutlet weak var lblTrack: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
