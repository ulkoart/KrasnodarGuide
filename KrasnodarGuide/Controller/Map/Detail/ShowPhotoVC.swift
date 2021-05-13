//
//  ShowPhotoVC.swift
//  KrasnodarGuide
//
//  Created by user on 15/04/2021.
//

import UIKit

class ShowPhotoVC: UIViewController {
    
    var imageScrollView: ImageScrollView!
    
    var image: UIImage!
    var sight: Sight!
    
    @IBOutlet weak var shareButton: UIButton!
    @IBAction func shareButtonPressed(_ sender: UIButton) {
        
        guard let title = sight.title,
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
        imageScrollView = ImageScrollView(frame: view.bounds)
        view.addSubview(imageScrollView)
        view.addSubview(shareButton)
        setupImageScrollView()
        self.imageScrollView.set(image: image)
    }
    
    func setupImageScrollView() {
        imageScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        imageScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
}
