//
//  NavigationController.swift
//  SwiftAccessibility
//
//  Created by Luciano Marisi on 12/08/2015.
//  Copyright © 2015 TechBrewers LTD. All rights reserved.
//

import UIKit
import TBRFontSizeAccessibility

class NavigationController: UINavigationController {

  @IBOutlet weak var accesibleTabBarItem: UITabBarItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let defaultFont = UIFont.systemFontOfSize(12);
    accesibleTabBarItem.accessibilityFont(defaultFont)
  }
}