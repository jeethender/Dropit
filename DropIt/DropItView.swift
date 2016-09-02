//  DropItView.swift
//  DropIt
//
//  Created by maisapride8 on 11/06/16.
//  Copyright © 2016 maisapride8. All rights reserved.
//

//import UIKit

/*class DropItView: UIView, UIDynamicAnimatorDelegate
{
    private lazy var animator: UIDynamicAnimator = {
        
        let animator = UIDynamicAnimator(referenceView: self)
        animator.delegate = self
        return animator
    }()
    
    func dynamicAnimatorDidPause(animator: UIDynamicAnimator) {
        removeCompletedRow()
    }
    
    private var dropBehavior = FallingObjectBehavior()
    var animating: Bool = false {
        didSet{
            if animating {
                animator.addBehavior(dropBehavior)
            }else {
                animator.removeBehavior(dropBehavior)
            }
        }
    }
    private func removeCompletedRow()
    {
        var dropsToRemove = [UIView]()
        
        var hitTestRect = CGRect(origin: bounds.lowerLeft, size: dropSize)
        repeat {
            hitTestRect.origin.x = bounds.minX
            hitTestRect.origin.y -= dropSize.height
            var dropsTested = 0
            var dropsFound = [UIView]()
            while dropsTested < dropsPerRow {
                if let hitView = hitTest(hitTestRect.mid) where hitView.superview == self {
                    dropsFound.append(hitView)
                } else {
                    break
                }
                hitTestRect.origin.x += dropSize.width
                dropsTested += 1
            }
            if dropsTested == dropsPerRow {
                dropsToRemove += dropsFound
            }
        } while dropsToRemove.count == 0 && hitTestRect.origin.y > bounds.minY
        
        for drop in dropsToRemove {
            dropBehavior.removeItem(drop)
            drop.removeFromSuperview()
        }
    }

    
   /* private func removeCompletedRow()
    {
        var dropsToRemove = [UIView]()
        
        var hitTestRect = CGRect(origin: bounds.lowerLeft, size: dropSize)
        repeat{
            hitTestRect.origin.x = bounds.minX
            hitTestRect.origin.y -= dropSize.height
            var dropsTested = 0
            var dropsFound = [UIView]()
            
            while dropsTested < dropsPerRow {
                
                if let hitView = hitTest(hitTestRect.mid) where hitView.superview == self {
                    dropsFound.append(hitView)
                }else {
                    break
                }
                hitTestRect.origin.x += dropSize.width
                dropsTested += 1
            }
            if dropsTested == dropsPerRow {
                dropsToRemove += dropsFound
            }
        } while dropsToRemove.count == 0 && hitTestRect.origin.y > bounds.minY
        
        for drop in dropsToRemove {
            dropBehavior.removeItem(drop)
            drop.removeFromSuperview()
        }
    }*/
    
    private var dropsPerRow = 10
    
    private var dropSize: CGSize {
        let size  = bounds.size.width / CGFloat(dropsPerRow)
        
        return CGSize(width: size, height: size)
    }
    
    func addDrop()
    {
        var frame = CGRect(origin: CGPoint.zero, size: dropSize)
        frame.origin.x = CGFloat.random(dropsPerRow) * dropSize.width
        
        let drop = UIView(frame: frame)
        drop.backgroundColor = UIColor.random
        
        addSubview(drop)
        dropBehavior.addItem(drop)
    }
    
}*/


import UIKit
class DropItView: UIView, UIDynamicAnimatorDelegate
{
    var animating: Bool = false {
        didSet {
            if animating {
                animator.addBehavior(dropBehavior)
                // updateRealGravity()
            } else {
                animator.removeBehavior(dropBehavior)
            }
        }
    }
    
    
    func addDrop()
    {
        var frame = CGRect(origin: CGPoint.zero, size: dropSize)
        frame.origin.x = CGFloat.random(dropsPerRow) * dropSize.width
        
        let drop = UIView(frame: frame)
        drop.backgroundColor = UIColor.random
        
        addSubview(drop)
        dropBehavior.addItem(drop)
        //lastDrop = drop
    }
    private let dropsPerRow = 10
    
    private var dropSize: CGSize {
        let size = bounds.size.width / CGFloat(dropsPerRow)
        return CGSize(width: size, height: size)
    }
    
    private let dropBehavior = FallingObjectBehavior()
    
    private lazy var animator: UIDynamicAnimator = {
        let animator = UIDynamicAnimator(referenceView: self)
        animator.delegate = self
        return animator
    }()
    
    
    func dynamicAnimatorDidPause(animator: UIDynamicAnimator) {
        removeCompletedRow()
    }
    
    private func removeCompletedRow()
    {
        var dropsToRemove = [UIView]()
        
        var hitTestRect = CGRect(origin: bounds.lowerLeft, size: dropSize)
        repeat {
            hitTestRect.origin.x = bounds.minX
            hitTestRect.origin.y -= dropSize.height
            var dropsTested = 0
            var dropsFound = [UIView]()
            while dropsTested < dropsPerRow {
                if let hitView = hitTest(hitTestRect.mid) where hitView.superview == self {
                    dropsFound.append(hitView)
                } else {
                    break
                }
                hitTestRect.origin.x += dropSize.width
                dropsTested += 1
            }
            if dropsTested == dropsPerRow {
                dropsToRemove += dropsFound
            }
        } while dropsToRemove.count == 0 && hitTestRect.origin.y > bounds.minY
        
        for drop in dropsToRemove {
            dropBehavior.removeItem(drop)
            drop.removeFromSuperview()
        }
    }
    

}
