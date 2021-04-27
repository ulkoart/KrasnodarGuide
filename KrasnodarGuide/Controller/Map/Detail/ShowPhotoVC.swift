//
//  ShowPhotoVC.swift
//  KrasnodarGuide
//
//  Created by user on 15/04/2021.
//

import UIKit

class ShowPhotoVC: UIViewController {
    @IBOutlet weak var photo: UIImageView!
    
    var image: UIImage!
    var sight: Sight!
    
    @IBAction func shareButtonPressed(_ sender: UIButton) {
        guard let title = sight.title,
              let image = image else { return }
        
        let share: [Any] = [title , image]
        let shareController = UIActivityViewController(activityItems: share, applicationActivities: nil)
        shareController.completionWithItemsHandler = {_, bool, _, _ in
            if bool {
                print ("Done")
            }
        }
        
        present(shareController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photo.image = image
        print(sight.photos)
        
        // передавать тольк sight
    }

}
