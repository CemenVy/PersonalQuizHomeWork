//
//  ResultViewController.swift
//  PersonalQuizHomeWork
//
//  Created by Семен Выдрин on 11.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    

}
