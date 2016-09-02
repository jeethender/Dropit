//
//  DropItViewController.swift
//  DropIt
//
//  Created by maisapride8 on 11/06/16.
//  Copyright © 2016 maisapride8. All rights reserved.
//

import UIKit

class DropItViewController: UIViewController
{
    @IBOutlet weak var gameView: DropItView! {
    didSet{
            gameView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addDrop(_:))))
        }
    }
   
    func addDrop(recognizer: UITapGestureRecognizer)
    {
        if recognizer.state == .Ended {
        gameView.addDrop()
    }
  }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        gameView.animating = true
        
         // gameView.animating = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        gameView.animating = false
    }
    
    
    
}
