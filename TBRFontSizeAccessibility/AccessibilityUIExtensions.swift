//
//  AccessibilityUIExtensions.swift
//  SwiftAccessibility
//
//  Created by Luciano Marisi on 12/08/2015.
//  Copyright © 2015 TechBrewers LTD. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
 public func accessibilityFont(fontParameter:UIFont) {
    originalFont = fontParameter
    accessibilityChangeObserver = AccessibilitySizeChangeObserver(fromObject:self, fromClosure:{ [unowned self] in
      self.font = self.originalFont.fontWithSize(self.originalFont.pointSize + AccessibilityPointSize.offset())
    })
  }
}

extension UITextView {
  public func accessibilityFont(fontParameter:UIFont) {
    originalFont = fontParameter
    accessibilityChangeObserver = AccessibilitySizeChangeObserver(fromObject:self, fromClosure:{ [unowned self] in
      self.font = self.originalFont.fontWithSize(self.originalFont.pointSize + AccessibilityPointSize.offset())
    })
  }
}

extension UITextField {
  public func accessibilityFont(fontParameter:UIFont) {
    originalFont = fontParameter
    accessibilityChangeObserver = AccessibilitySizeChangeObserver(fromObject:self, fromClosure:{ [unowned self] in
      self.font = self.originalFont.fontWithSize(self.originalFont.pointSize + AccessibilityPointSize.offset())
    })
  }
}

extension UINavigationBar {
  public func accessibilityFont(fontParameter:UIFont) {
    originalFont = fontParameter
    accessibilityChangeObserver = AccessibilitySizeChangeObserver(fromObject:self, fromClosure:{ [unowned self] in
      
      var newTitleTextAttributes = self.titleTextAttributes
      if newTitleTextAttributes == nil {
        newTitleTextAttributes = [String : AnyObject]?()
      }
      let accesibleFont = self.originalFont.fontWithSize(self.originalFont.pointSize + AccessibilityPointSize.offset())
      newTitleTextAttributes?.updateValue(accesibleFont, forKey: NSFontAttributeName)
      
      self.titleTextAttributes = newTitleTextAttributes
    })
  }
}

extension UITabBarItem {
  public func accessibilityFont(fontParameter:UIFont) {
    originalFont = fontParameter
    accessibilityChangeObserver = AccessibilitySizeChangeObserver(fromObject:self, fromClosure:{ [unowned self] in
      var newTitleTextAttributes = self.titleTextAttributesForState(.Normal)
      if newTitleTextAttributes == nil {
        newTitleTextAttributes = [String : AnyObject]?()
      }
      let accesibleFont = self.originalFont.fontWithSize(self.originalFont.pointSize + AccessibilityPointSize.offset())
      newTitleTextAttributes?.updateValue(accesibleFont, forKey: NSFontAttributeName)

      self.setTitleTextAttributes(newTitleTextAttributes, forState:.Normal)
    })
  }
}