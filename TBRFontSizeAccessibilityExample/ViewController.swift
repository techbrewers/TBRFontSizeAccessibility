//
//  ViewController.swift
//  TBRFontSizeAccessibility
//
//  Created by Luciano Marisi on 13/08/2015.
//  Copyright (c) 2015 TechBrewers LTD. All rights reserved.
//

import UIKit
import ObjectiveC
import TBRFontSizeAccessibility

class ViewController: UIViewController {

  @IBOutlet weak var accesibleLabel: UILabel!
  @IBOutlet weak var accesibleTextView: UITextView!
  @IBOutlet weak var accesibleTextField: UITextField!
  @IBOutlet weak var accesibleButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()

    // Base font
    let baseFont = UIFont.systemFontOfSize(20);

    accesibleLabel.accessibilityFont(baseFont)
    accesibleTextView.accessibilityFont(baseFont)
    accesibleTextField.accessibilityFont(baseFont)
    accesibleButton.titleLabel?.accessibilityFont(baseFont)
    navigationController?.navigationBar.accessibilityFont(baseFont)

    // Use this block if you want your object to listen for accessibility changes on unsupported classes
    accesibleLabel.accessibilityChangeObserver = AccessibilitySizeChangeObserver(fromObject:self, fromClosure:{ [unowned self] in
      self.accesibleLabel.font = baseFont.fontWithSize(baseFont.pointSize + AccessibilityPointSize.offset())
      })

  }
}

