//
//  AccessibilityChangeObserver.swift
//  SwiftAccessibility
//
//  Created by Luciano Marisi on 12/08/2015.
//  Copyright © 2015 TechBrewers LTD. All rights reserved.
//

import UIKit
import ObjectiveC

public class AccessibilitySizeChangeObserver {
  let closure : AccessibilitySizeChangeHandler
  let observingObject : NSObject
  
  public init(fromObject observingObjectParameter:NSObject, fromClosure closureParameter: AccessibilitySizeChangeHandler) {
    closure = closureParameter;
    observingObject = observingObjectParameter;
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "sizeChanged:", name: UIContentSizeCategoryDidChangeNotification, object: nil)
  }
  
  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification, object: nil)
  }
  
  @objc func sizeChanged(notification: NSNotification) {
    closure()
  }
  
}

public typealias AccessibilitySizeChangeHandler = Void->Void

private var AssociationKeyChangeObserver: UInt8 = 0
private var AssociationKeyOriginalFont: UInt8 = 0

public extension NSObject {
  public var accessibilityChangeObserver: (AccessibilitySizeChangeObserver)! {
    get {
      return objc_getAssociatedObject(self, &AssociationKeyChangeObserver) as? AccessibilitySizeChangeObserver
    }
    set(newAccessibilityChangeObserver) {
      objc_setAssociatedObject(self, &AssociationKeyChangeObserver, newAccessibilityChangeObserver, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN))
      newAccessibilityChangeObserver.closure();
    }
  }
  
  
  var originalFont: (UIFont)! {
    get {
      return objc_getAssociatedObject(self, &AssociationKeyOriginalFont) as? UIFont
    }
    set(newAccessibilityChangeObserver) {
      objc_setAssociatedObject(self, &AssociationKeyOriginalFont, newAccessibilityChangeObserver, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN))
    }
  }
}