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
  func move(delay: NSTimeInterval, reference: UIView, view: UIView, x: CGFloat, y: CGFloat, alpha: CGFloat, w:CGFloat, h:CGFloat) {

    animator = UIDynamicAnimator(referenceView: reference)
    UIView.animateWithDuration(delay, animations: {
      if(x != 0) {
        view.frame.origin.x = x
      }
      if(y != 0) {
        view.frame.origin.y = y
      }

      if(w != 0) {
        view.bounds.size.width = w
      }

      if(h != 0) {
        view.bounds.size.height = h
      }

      view.alpha = alpha

    }, completion: {
    (finished: Bool) in
      //println("animation complete")
      /* could add callback references to this as well */
    })

    var snapBehavior: UISnapBehavior = UISnapBehavior(item: view, snapToPoint: reference.center)
    animator.addBehavior(snapBehavior)
  }
}

extension UIView {
  public func grow(w:CGFloat, h:CGFloat, delay:NSTimeInterval, reference: UIView) {
    Animate().move(delay, reference:reference, view:self, x:0, y:0, alpha: self.alpha, w:w, h:h)
  }
  public func moveY(y:CGFloat, delay:NSTimeInterval, reference: UIView) {
    Animate().move(delay, reference:reference, view:self, x:0, y:y, alpha: self.alpha, w:0, h:0)
  }
  public func moveX(x:CGFloat, delay:NSTimeInterval, reference: UIView) {
    Animate().move(delay, reference:reference, view:self, x:x, y:0, alpha: self.alpha, w:0, h:0)
  }
  public func moveRight(x:CGFloat, delay:NSTimeInterval, reference: UIView) {
    Animate().move(delay, reference:reference, view:self, x:self.frame.origin.x + x, y:0, alpha: self.alpha, w:0, h:0)
  }
  public func moveLeft(x:CGFloat, delay:NSTimeInterval, reference: UIView) {
    Animate().move(delay, reference:reference, view:self, x:self.frame.origin.x - x, y:0, alpha: self.alpha, w:0, h:0)
  }
  public func moveUp(y:CGFloat, delay:NSTimeInterval, reference: UIView) {
    Animate().move(delay, reference:reference, view:self, x:0, y:self.frame.origin.y - y, alpha: self.alpha, w:0, h:0)
  }
  public func moveDown(y:CGFloat, delay:NSTimeInterval, reference: UIView) {
    Animate().move(delay, reference:reference, view:self, x:0, y:self.frame.origin.y + y, alpha: self.alpha, w:0, h:0)
  }
  public func fade(alpha:CGFloat, delay:NSTimeInterval, reference: UIView) {
    Animate().move(delay, reference:reference, view:self, x:0, y:0, alpha: alpha, w:0, h:0)
  }
  public func fadeOut(delay:NSTimeInterval, reference: UIView) {
    Animate().move(delay, reference:reference, view:self, x:0, y:0, alpha: 0, w:0, h:0)
  }
  public func fadeIn(delay:NSTimeInterval, reference: UIView) {
    Animate().move(delay, reference:reference, view:self, x:0, y:0, alpha: 1, w:0, h:0)
  }


}


/*
//Usage
var delay:NSTimeInterval = NSTimeInterval(0.25)
_myView.fadeIn(delay, reference: view)
_myView.moveY(settingsorigin, delay: delay, reference: view)
*/