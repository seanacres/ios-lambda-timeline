//
//  AudioCommentTableViewCell.swift
//  LambdaTimeline
//
//  Created by Sean Acres on 7/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol AudioCommentTableViewCellDelegate: class {
    func hasPlayTapped(on cell: AudioCommentTableViewCell)
}

class AudioCommentTableViewCell: UITableViewCell {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var audioSlider: UISlider!
    
    weak var delegate: AudioCommentTableViewCellDelegate?

    @IBAction func playButtonTapped(_ sender: Any) {
        self.delegate?.hasPlayTapped(on: self)
    }
}
