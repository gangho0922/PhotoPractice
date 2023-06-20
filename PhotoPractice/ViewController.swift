//
//  ViewController.swift
//  PhotoPractice
//
//  Created by AnnKangHo on 2023/06/19.
//

import UIKit
import Then
import SnapKit

class ViewController: BaseVC {

    let profileChangeBtn = UIButton().then {
        $0.setTitle("사진 찍기", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        $0.setTitleColor(UIColor.systemBlue, for: .normal)
    }
    
    let profileImage = UIImageView().then {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = $0.frame.height / 2
        $0.clipsToBounds = true
    }
    override func addView() {
        view.addSubview(profileChangeBtn)
        view.addSubview(profileImage)
    }
    override func location() {
        profileChangeBtn.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(80)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-80)
        }
        profileImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(150)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-150)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(50)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-50)
            
        }
    }
}
