//
//  ViewController.swift
//  App
//
//  Created by Cinnamon Agency on 28/09/2017.
//  Copyright © 2017 Cinnamon Agency. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image = UIImage(named: "slika")
    }
    
    @IBAction func crop(_ sender: UIBarButtonItem) {
        let scale:CGFloat = 1/scrollView.zoomScale
        let x:CGFloat = scrollView.contentOffset.x * scale
        let y:CGFloat = scrollView.contentOffset.y * scale
        let width:CGFloat = scrollView.frame.size.width * scale
        let height:CGFloat = scrollView.frame.size.height * scale
        let croppedCGImage = imageView.image?.cgImage?.cropping(to: CGRect(x: x, y: y, width: width, height: height))
        let croppedImage = UIImage(cgImage: croppedCGImage!)
        setImageToCrop(croppedimage: croppedImage)
    }
    
    var cropped:UIImage?
    
    func setImageToCrop(croppedimage:UIImage){
        cropped = croppedimage
        performSegue(withIdentifier: "Show cropped image", sender: nil)
    }
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.4
            scrollView.maximumZoomScale = 5.0
            scrollView.contentSize = imageView.frame.size
            scrollView.addSubview(imageView)
        }
    }
    
    private var imageView = UIImageView()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ImageViewController{
            if segue.identifier == "Show cropped image"{
                if let croppedImage = cropped{
                    destination.image = croppedImage
                }
            }
        }
    }
}

extension ViewController : UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
