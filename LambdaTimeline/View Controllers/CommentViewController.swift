//
//  CommentViewController.swift
//  LambdaTimeline
//
//  Created by Sean Acres on 7/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {

    @IBOutlet weak var recordingTimeLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var commentTextField: UITextField!
    
    var isAudioComment: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    private func updateViews() {
        if isAudioComment {
            commentTextField.isHidden = true
        } else {
            recordingTimeLabel.isHidden = true
            recordButton.isHidden = true
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func recordButtonTapped(_ sender: Any) {
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
}
