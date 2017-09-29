//
//  ImageViewController.swift
//  App
//
//  Created by Cinnamon Agency on 29/09/2017.
//  Copyright © 2017 Cinnamon Agency. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
}
