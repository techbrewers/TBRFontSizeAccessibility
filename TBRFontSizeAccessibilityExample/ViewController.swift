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
    let defaultFont = UIFont.systemFontOfSize(20);

    accesibleLabel.accessibilityFont(defaultFont)
    accesibleTextView.accessibilityFont(defaultFont)
    accesibleTextField.accessibilityFont(defaultFont)
    accesibleButton.titleLabel?.accessibilityFont(defaultFont)
    navigationController?.navigationBar.accessibilityFont(defaultFont)

    accesibleLabel.accesibilityChangeObserver = AccessibilitySizeChangeObserver(fromObject:self, fromClosure:{ [unowned self] in
      self.accesibleLabel.font = defaultFont.fontWithSize(defaultFont.pointSize + AccessibilityPointSize.offset())
      })

  }
}

