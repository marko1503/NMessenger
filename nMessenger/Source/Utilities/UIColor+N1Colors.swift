//
// Copyright (c) 2016 eBay Software Foundation
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import Foundation
import UIKit

//MARK: UIColor extension
/**
 Custom Colors for NMessenger
 */
extension UIColor {
    class func n1MidGreyColor() -> UIColor {
        return UIColor(red: 144.0 / 255.0, green: 164.0 / 255.0, blue: 174.0 / 255.0, alpha: 1)
    }
    
    class func n1DarkestGreyColor() -> UIColor {
        return UIColor(red: 38.0 / 255.0, green: 50.0 / 255.0, blue: 56.0 / 255.0, alpha: 1)
    }
    
    class func n1RedColor() -> UIColor {
        return UIColor(red: 255.0 / 255.0, green: 87.0 / 255.0, blue: 34.0 / 255.0, alpha: 1)
    }
    
    class func n1BlueColor() -> UIColor {
        return UIColor(red: 38.0 / 255.0, green: 94.0 / 255.0, blue: 105.0 / 255.0, alpha: 1)
    }
    
    class func n1GrayColor() -> UIColor {
        return UIColor(red: 110.0 / 255.0, green: 118.0 / 255.0, blue: 127.0 / 255.0, alpha: 1)
    }
    
    class func n1BrandRedColor() -> UIColor {
        return UIColor(red: 255.0 / 255.0, green: 38.0 / 255.0, blue: 66.0 / 255.0, alpha: 1)
    }
    
    class func n1ActionBlueColor() -> UIColor {
        return UIColor(red: 74.0 / 255.0, green: 144.0 / 255.0, blue: 226.0 / 255.0, alpha: 1)
    }
    
    class func n1OverlayBorderColor() -> UIColor {
        return UIColor(red: 38.0 / 255.0, green: 49.0 / 255.0, blue: 56.0 / 255.0, alpha: 0.1)
    }
    
    class func n1AlmostWhiteColor() -> UIColor {
        return UIColor(red: 251.0 / 255.0, green: 252.0 / 255.0, blue: 253.0 / 255.0, alpha: 1)
    }
    
    class func n1DarkerGreyColor() -> UIColor {
        return UIColor(red: 67.0 / 255.0, green: 76.0 / 255.0, blue: 87.0 / 255.0, alpha: 1.0)
    }
    
    class func n1LightGreyColor() -> UIColor {
        return UIColor(red: 177.0 / 255.0, green: 177.0 / 255.0, blue: 177.0 / 255.0, alpha: 1)
    }
    
    class func n1LighterGreyColor() -> UIColor {
        return UIColor.init(red: 187.0/255.0, green: 197.0/255.0, blue: 202.0/255.0, alpha: 1)
    }
    
    class func n1WhiteColor() -> UIColor {
        return UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1)
    }
    
    class func n1Black50Color() -> UIColor { 
        return UIColor.init(red: 233.0/255.0, green: 233.0/255.0, blue: 233.0/255.0, alpha: 1)
    }

    class func colorFromRGB(_ rgbHexValue: UInt) -> UIColor {
            return UIColor(
                red: CGFloat((rgbHexValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbHexValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbHexValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        }
    /** returns a random color */
    class func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    }
