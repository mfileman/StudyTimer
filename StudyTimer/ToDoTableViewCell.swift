//
//  ToDoTableViewCell.swift
//  StudyTimer
//
//  Created by madison on 12/21/17.
//  Copyright © 2017 MadisonFileman. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    @IBOutlet var toDoItem: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
