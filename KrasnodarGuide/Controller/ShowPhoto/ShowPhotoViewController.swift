//
//  ShowPhotoViewController.swift
//  KrasnodarGuide
//
//  Created by user on 06.09.2021.
//

import UIKit

final class ShowPhotoViewController: UIViewController {
    
    var imageScrollView: ImageScrollView!
    var image: UIImage!
    var photoTitle: String!
    
    private var shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "share2"), for: .normal)
        button.addTarget(self, action: #selector(shareButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc private func shareButtonPressed(_ sender: UIButton) {
        
        guard let title = photoTitle,
              let image = image else { return }
        
        let share: [Any] = [title , image]
        let shareController = UIActivityViewController(activityItems: share, applicationActivities: nil)
        shareController.completionWithItemsHandler = {_, bool, _, _ in
            if bool {
                print ("\(#function) - Done!")
            }
        }
        present(shareController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1)
        imageScrollView = ImageScrollView(frame: view.bounds)
        view.addSubview(imageScrollView)
        view.addSubview(shareButton)
        setupImageScrollView()
        setupShareButton()
        self.imageScrollView.set(image: image)
    }
    
    private func setupImageScrollView() {
        imageScrollView.translatesAutoresizingMaskIntoConstraints = false        
        imageScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    private func setupShareButton() {
        shareButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        shareButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
}
