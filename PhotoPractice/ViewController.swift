//
//  ViewController.swift
//  PhotoPractice
//
//  Created by AnnKangHo on 2023/06/19.
//

import UIKit
import Then
import SnapKit
import YPImagePicker
class ViewController: BaseVC {

    let profileChangeBtn = UIButton().then {
        $0.setTitle("사진 찍기", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        $0.setTitleColor(UIColor.systemBlue, for: .normal)
        $0.backgroundColor = .yellow
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    let profileImage = UIImageView().then {
        $0.backgroundColor = .black
        $0.layer.masksToBounds = true
    }
    
    override func addView() {
        view.addSubview(profileChangeBtn)
        view.addSubview(profileImage)
    }
    override func location() {
        profileChangeBtn.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-100)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(80)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-80)
        }
        profileImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-200)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-40)
            $0.width.equalTo(200)
            $0.height.equalTo(200)
            
        }
    }
    override func addTarget() {
        profileChangeBtn.addTarget(self, action: #selector(profileChangeBtnTapped), for: .touchUpInside)
    }
}
extension ViewController {
    @objc fileprivate func profileChangeBtnTapped(_ sender: UIButton) {
        var config = YPImagePickerConfiguration()
        config.screens = [.library, .photo, .video]
        config.library.mediaType = .video
        
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                self.profileImage.image = photo.image
               // self.profileImage.layer.cornerRadius = self.profileImage.frame.height / 2
                self.profileImage.layer.cornerRadius = self.profileImage.frame.width / 2
            }
            else if let video = items.singleVideo {
                print(video.fromCamera)
                print(video.thumbnail)
                print(video.url)
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
}
