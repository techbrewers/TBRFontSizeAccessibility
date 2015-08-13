//
//  AccessibilityPointSizeOffset.swift
//  SwiftAccessibility
//
//  Created by Luciano Marisi on 11/08/2015.
//  Copyright © 2015 TechBrewers LTD. All rights reserved.
//

import Foundation
import UIKit

public class AccessibilityPointSize {
  public class func offset()->CGFloat {
    let contentSizeString = UIApplication.sharedApplication().preferredContentSizeCategory;
    let mapping : [String: CGFloat] = [
      UIContentSizeCategoryExtraSmall                        : -5,
      UIContentSizeCategorySmall                             : -3,
      UIContentSizeCategoryMedium                            : -1,
      UIContentSizeCategoryLarge                             : 0,
      UIContentSizeCategoryExtraLarge                        : 1,
      UIContentSizeCategoryExtraExtraLarge                   : 3,
      UIContentSizeCategoryExtraExtraExtraLarge              : 5,
      UIContentSizeCategoryAccessibilityMedium               : 7,
      UIContentSizeCategoryAccessibilityLarge                : 9,
      UIContentSizeCategoryAccessibilityExtraLarge           : 11,
      UIContentSizeCategoryAccessibilityExtraExtraLarge      : 13,
      UIContentSizeCategoryAccessibilityExtraExtraExtraLarge : 15
    ]
    
    if let fontSizeOffset = mapping[contentSizeString] {
      return fontSizeOffset;
    } else {
      return 0;
    }
  }
}