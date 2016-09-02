//
//  FallingObjectBehavior.swift
//  DropIt
//
//  Created by maisapride8 on 13/06/16.
//  Copyright © 2016 maisapride8. All rights reserved.
//

import UIKit

class FallingObjectBehavior: UIDynamicBehavior
{
    private let gravity = UIGravityBehavior()
    
    private let collider: UICollisionBehavior =  {
        let collider = UICollisionBehavior()
        collider.translatesReferenceBoundsIntoBoundary = true
        return collider
    }()
    
    private let itemBehavior: UIDynamicItemBehavior = {
        let dib = UIDynamicItemBehavior()
        dib.allowsRotation = false
        dib.elasticity = 0.75
       
        return dib
    }()
    
    func addBarrier(path: UIBezierPath, named name: String) {
        collider.removeBoundaryWithIdentifier(name)
        collider.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(itemBehavior)
    }
    
    func addItem(item: UIDynamicItem){
        gravity.addItem(item)
        collider.addItem(item)
        itemBehavior.addItem(item)
    }
    
    func removeItem(item: UIDynamicItem){
        gravity.removeItem(item)
        collider.removeItem(item)
        itemBehavior.addItem(item)
    }
    
}
