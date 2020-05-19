//
//  ViewController.swift
//  SideMenuApp
//
//  Created by abdullah on 26/09/1441 AH.
//  Copyright © 1441 abdullah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var BlurView: UIVisualEffectView!
    
    @IBOutlet weak var ViewConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var SideView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ImageView.contentMode = .scaleAspectFill
        BlurView.layer.cornerRadius = 8
        SideView.layer.cornerRadius = 8
        SideView.layer.shadowColor = UIColor.white.cgColor
        SideView.layer.shadowOpacity = 1
        SideView.layer.shadowOffset = CGSize(width: 5 , height : 0)
        
        
        ViewConstraint.constant = -175
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBAction func PanPerformed(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: self.view).x
            if translation > 0 {  //swipe right
                
                if ViewConstraint.constant < 20 {
                    UIView.animate(withDuration: 0.2 , animations:  {
                        self.ViewConstraint.constant += translation
                        self.view.layoutIfNeeded()
                        
                    })
                }
                
            } else { // swipe left
                
                if ViewConstraint.constant > -175 {
                    UIView.animate(withDuration: 0.2 , animations:  {
                        self.ViewConstraint.constant += translation
                        self.view.layoutIfNeeded()
                        
                    })
                }
                
            }
            
        } else if sender.state == .ended {
            
            if ViewConstraint.constant < -100 {
                UIView.animate(withDuration: 0.2 , animations:  {
                    self.ViewConstraint.constant  = -175
                    self.view.layoutIfNeeded()
                    
                })
                
                
            } else {
                
                UIView.animate(withDuration: 0.2 , animations:  {
                                  self.ViewConstraint.constant  = 0
                                  self.view.layoutIfNeeded()
                                  
                              })
                
            }
            
        }
        
        
    }
    


}

