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

import SwiftUI

struct ContentView: View {
  @State private var colorPicker = ColorPicker()
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass

  var body: some View {
    let isBigIphoneLandscape = verticalSizeClass == .compact && horizontalSizeClass == .regular
    let isSmallIphoneLandscape = verticalSizeClass == .compact && horizontalSizeClass == .compact

    if isBigIphoneLandscape || isSmallIphoneLandscape {
      LandscapeView(colorPicker: $colorPicker)
    } else {
      PortraitView(colorPicker: $colorPicker)
    }
  }
}

struct PortraitView: View {
  @Binding var colorPicker: ColorPicker
  @Environment(\.colorScheme) var colorScheme

  var body: some View {
    VStack {
      Text("Color Picker")
        .font(.largeTitle)
        .bold()
        .foregroundColor(colorScheme == .dark ? .white : .black)
      ChosenColorView(chosenColor: $colorPicker.chosenColor)
        .padding(.bottom)
      ColorSliderView(color: $colorPicker.redSliderValue, name: "Red", accentColor: Constants.Colors.redSliderAccentColor)
      ColorSliderView(color: $colorPicker.greenSliderValue, name: "Green", accentColor: Constants.Colors.greenSliderAccentColor)
      ColorSliderView(color: $colorPicker.blueSliderValue, name: "Blue", accentColor: Constants.Colors.blueSliderAccentColor)
      SetColorButton(colorPicker: $colorPicker)
    }
    .background(colorScheme == .dark ? .black : .white)
    .padding(20)
  }
}

struct LandscapeView: View {
  @Binding var colorPicker: ColorPicker
  @Environment(\.colorScheme) var colorScheme

  var body: some View {
    HStack {
      VStack {
        Text("Color Picker")
          .font(.largeTitle)
          .bold()
          .foregroundColor(colorScheme == .dark ? .white : .black)
        ChosenColorView(chosenColor: $colorPicker.chosenColor)
      }
      .padding(.trailing)
      VStack {
        ColorSliderView(color: $colorPicker.redSliderValue, name: "Red", accentColor: Constants.Colors.redSliderAccentColor)
        ColorSliderView(color: $colorPicker.greenSliderValue, name: "Green", accentColor: Constants.Colors.greenSliderAccentColor)
        ColorSliderView(color: $colorPicker.blueSliderValue, name: "Blue", accentColor: Constants.Colors.blueSliderAccentColor)
        SetColorButton(colorPicker: $colorPicker)
      }
    }
    .background(colorScheme == .dark ? .black : .white)
    .padding(20)
  }
}

struct ChosenColorView: View {
  @Binding var chosenColor: Color

  var body: some View {
    RoundedRectangle(cornerRadius: 0)
      .foregroundColor(chosenColor)
      .border(Constants.Colors.chosenColorViewBorderColor, width: Constants.General.chosenColorViewBorder)
  }
}

struct SetColorButton: View {
  @Binding var colorPicker: ColorPicker

  var body: some View {
    Button {
      colorPicker.setChosenColor()
    } label: {
      Text("Set Color")
        .padding(Constants.General.buttonPadding)
        .background(.blue)
        .foregroundColor(.white)
        .cornerRadius(Constants.General.buttonCornerRadius)
        .overlay {
          RoundedRectangle(cornerRadius: Constants.General.buttonCornerRadius)
            .strokeBorder(Color.white, lineWidth: Constants.General.buttonStrokeWidth)
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .previewDevice("iPhone 14 Pro Max")
    ContentView()
      .preferredColorScheme(.dark)
    ContentView()
      .previewDevice("iPhone 14 Pro Max")
      .previewInterfaceOrientation(.landscapeRight)
    ContentView()
      .previewDevice("iPhone 14 Pro")
      .preferredColorScheme(.dark)
      .previewInterfaceOrientation(.landscapeRight)
  }
}
