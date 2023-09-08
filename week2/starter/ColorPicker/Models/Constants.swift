/// Copyright (c) 2023 Kodeco Inc.
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation
import SwiftUI

enum Constants {
  enum General {
    public static let displayColorViewBorderWidth = CGFloat(10)
    public static let buttonPadding = CGFloat(18)
    public static let buttonCornerRadius = CGFloat(21)
    public static let buttonStrokeWidth = CGFloat(1)
    public static let redSliderInitialValue = 255.0
    public static let greenSliderInitialValue = 214.0
    public static let blueSliderInitialValue = 0.0
    public static let landscapeViewPadding = CGFloat(20)
    public static let portraitViewPadding = CGFloat(20)
  }

  enum Colors {
    public static let chosenColorViewInitialColor = Color(red: General.redSliderInitialValue / 255, green: General.greenSliderInitialValue / 255, blue: General.blueSliderInitialValue / 255)
    public static let displayColorViewBorderColor = Color.gray.opacity(0.5)
    public static let redSliderAccentColor = Color("RedSliderAccentColor")
    public static let greenSliderAccentColor = Color("GreenSliderAccentColor")
    public static let blueSliderAccentColor = Color("BlueSliderAccentColor")
  }
}
