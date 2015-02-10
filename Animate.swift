//
//  Animate.swift
//  My Pace
//
//  Created by Carlos Rodriguez on 11/18/14.
//  Copyright (c) 2014 Carlos Rodriguez. All rights reserved.
//

import Foundation
import UIKit


class Animate {
  var animator: UIDynamicAnimator!
  func move(delay: NSTimeInterval, reference: UIView, view: UIView, x: CGFloat = 0.001, y: CGFloat = 0.001, alpha: CGFloat, w:CGFloat = 0.001, h:CGFloat = 0.001, callback: (finished:Bool) -> ()) {
    

    animator = UIDynamicAnimator(referenceView: reference)
    UIView.animateWithDuration(delay, animations: {
      
      if(x != 0.001) {
        view.frame.origin.x = x
      }
      if(y != 0.001) {
        view.frame.origin.y = y
      }
      if(w != 0.001) {
        view.bounds.size.width = w
      }
      if(h != 0.001) {
        view.bounds.size.height = h
      }
      
      view.alpha = alpha
      
    }, completion: {
    (finished: Bool) in
      callback(finished: true)
    })
  
    var snapBehavior: UISnapBehavior = UISnapBehavior(item: view, snapToPoint: reference.center)
    animator.addBehavior(snapBehavior)
  }
  
  func newImage(delay: NSTimeInterval, reference: UIView, view: UIImageView, img: String) {
    
    animator = UIDynamicAnimator(referenceView: reference)
    UIView.animateWithDuration(delay, animations: {
        view.image = UIImage(named: img)
      }, completion: {
        (finished: Bool) in
        //fin
    })
    
    var snapBehavior: UISnapBehavior = UISnapBehavior(item: view, snapToPoint: reference.center)
    animator.addBehavior(snapBehavior)
  }
}

extension UIImageView {
  public func swap(img:String, delay:NSTimeInterval, reference: UIView) {
    Animate().newImage(delay, reference: reference, view: self, img: img)
  }
}

extension UIView {
  public func grow(w:CGFloat, h:CGFloat, delay:NSTimeInterval, reference: UIView, callback: (finished: Bool) -> ()) {
    Animate().move(delay, reference:reference, view:self, alpha: self.alpha, w:w, h:h, callback:callback)
  }
  public func moveY(y:CGFloat, delay:NSTimeInterval, reference: UIView, callback: (finished: Bool) -> ()) {
    Animate().move(delay, reference:reference, view:self, y:y, alpha: self.alpha, callback:callback)
  }
  public func moveX(x:CGFloat, delay:NSTimeInterval, reference: UIView, callback: (finished: Bool) -> ()) {
    Animate().move(delay, reference:reference, view:self, x:x, alpha: self.alpha, callback:callback)
  }
  public func moveRight(x:CGFloat, delay:NSTimeInterval, reference: UIView, callback: (finished: Bool) -> ()) {
    Animate().move(delay, reference:reference, view:self, x:self.frame.origin.x + x, alpha: self.alpha, callback:callback)
  }
  public func moveLeft(x:CGFloat, delay:NSTimeInterval, reference: UIView, callback: (finished: Bool) -> ()) {
    Animate().move(delay, reference:reference, view:self, x:self.frame.origin.x - x, alpha: self.alpha, callback:callback)
  }
  public func moveUp(y:CGFloat, delay:NSTimeInterval, reference: UIView, callback: (finished: Bool) -> ()) {
    Animate().move(delay, reference:reference, view:self, y:self.frame.origin.y - y, alpha: self.alpha, callback:callback)
  }
  public func moveDown(y:CGFloat, delay:NSTimeInterval, reference: UIView, callback: (finished: Bool) -> ()) {
    Animate().move(delay, reference:reference, view:self, y:self.frame.origin.y + y, alpha: self.alpha, callback:callback)
  }
  public func fade(alpha:CGFloat, delay:NSTimeInterval, reference: UIView, callback: (finished: Bool) -> ()) {
    Animate().move(delay, reference:reference, view:self, alpha: alpha, callback:callback)
  }
  public func fadeOut(delay:NSTimeInterval, reference: UIView, callback: (finished: Bool) -> ()) {
    Animate().move(delay, reference:reference, view:self, alpha: 0, callback:callback)
  }
  public func fadeIn(delay:NSTimeInterval, reference: UIView, callback: (finished: Bool) -> ()) {
    Animate().move(delay, reference:reference, view:self, alpha: 1, callback:callback )
  }
  
  
}


/*
//Usage
var delay:NSTimeInterval = NSTimeInterval(0.25)
_myView.fadeIn(delay, reference: view)
_myView.moveY(100, delay: NSTimeInterval(0.25), reference: view)
*/
