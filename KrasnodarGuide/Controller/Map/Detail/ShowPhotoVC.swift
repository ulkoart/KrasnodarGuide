//
//  ShowPhotoVC.swift
//  KrasnodarGuide
//
//  Created by user on 15/04/2021.
//

import UIKit

class ShowPhotoVC: UIViewController {
    @IBOutlet weak var photo: UIImageView!
    
    var image: UIImage?
    
    @IBAction func shareButtonPressed(_ sender: UIButton) {
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
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
    }

}
