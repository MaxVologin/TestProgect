//
//  URLSessionViewController.swift
//  TestProgect
//
//  Created by Maxim Vologin on 17.08.2022.
//

import UIKit

class URLSessionViewController: UIViewController {

    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func getImageData(_ sender: Any) {
        
        let API = "https://picsum.photos/200/300"
        // 1234
        //567890
        guard let apiURL = URL(string: API) else {
            fatalError("Some Error")
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: apiURL) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
