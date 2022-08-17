//
//  ViewController.swift
//  TestProgect
//
//  Created by Maxim Vologin on 17.08.2022.
//

import UIKit

class LayoutViewController: UIViewController {

    var topConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let redSquare = UIView()
        view.addSubview(redSquare)
        redSquare.backgroundColor = .red
        redSquare.translatesAutoresizingMaskIntoConstraints = false
        redSquare.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        redSquare.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        redSquare.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        redSquare.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        let blueSquare = UIView()
        redSquare.addSubview(blueSquare)
        blueSquare.backgroundColor = .blue
        blueSquare.translatesAutoresizingMaskIntoConstraints = false
        
        topConstraint = blueSquare.topAnchor.constraint(equalTo: redSquare.topAnchor, constant: 20)
        topConstraint?.isActive = true
        NSLayoutConstraint.activate([
            blueSquare.bottomAnchor.constraint(equalTo: redSquare.bottomAnchor, constant: -20),
            blueSquare.leftAnchor.constraint(equalTo: redSquare.leftAnchor, constant: 20),
            blueSquare.rightAnchor.constraint(equalTo: redSquare.rightAnchor, constant: -20)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1,
                       delay: 1,
                       options: .curveLinear) {
            [ weak self ] in
            self?.topConstraint?.constant = 500
//            self?.view.setNeedsLayout()
            self?.view.layoutIfNeeded()
        }
    }
}
