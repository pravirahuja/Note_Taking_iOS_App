//
//  TaskInfoViewController.swift
//  CoreToDo
//
//  Created by Pravir on 10/04/18.
//  Copyright © 2018 Pravir. All rights reserved.
//

import UIKit

class TaskInfoViewController: UIViewController {
    
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    
    var NoteTitle: String!
    var NoteDescription: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTitleLabel.text = NoteTitle
        taskDescriptionLabel.text = NoteDescription
        
        // Do any additional setup after loading the view.
    }

    

}
