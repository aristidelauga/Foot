//
//  UIApplication+Extension.swift
//  Foot
//
//  Created by Aristide LAUGA on 22/06/2023.
//

import UIKit

extension UIApplication {
  func dismissKeyboard() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
