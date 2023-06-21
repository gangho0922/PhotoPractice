//
//  BaseVC.swift
//  PhotoPractice
//
//  Created by AnnKangHo on 2023/06/19.
//

import UIKit

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        location()
        addTarget()
    }
    
    func addView(){}
    func location(){}
    func addTarget(){}
}
