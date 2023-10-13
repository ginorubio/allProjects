//
//  ViewController.swift
//  demoCalendarFSCalendar
//
//  Created by Rubio Pacheco Gino Franks on 8/05/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let calendarView = MBAlertComponentSelectSingleDateView()
        contentView.addSubview(calendarView)
    }


}

