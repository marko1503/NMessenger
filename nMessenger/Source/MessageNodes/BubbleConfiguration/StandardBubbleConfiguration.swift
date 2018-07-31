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

/** Uses a default bubble as primary and a stacked bubble as secondary. Incoming color is pale grey and outgoing is blue */
open class StandardBubbleConfiguration: BubbleConfigurationProtocol {

    open var isMasked = false
    
    public init() {}
    
    open func getIncomingColor() -> UIColor
    {
        return UIColor.n1WhiteColor()
    }
    
    open func getOutgoingColor() -> UIColor
    {
        return UIColor.n1Black50Color()
    }
    
    open func getAcceptColor() -> UIColor
    {
        return UIColor.n1RedColor()
    }
    
    open func getDeclineColor() -> UIColor
    {
        return UIColor.n1GrayColor()
    }
    
    open func getCanceledColor() -> UIColor
    {
        return UIColor.n1LightGreyColor()
    }
    
    open func getDeliveredColor() -> UIColor
    {
        return UIColor.n1BlueColor()
    }
    
    open func getBubble() -> Bubble
    {
        let newBubble = DefaultBubble()
        newBubble.hasLayerMask = isMasked
        return newBubble
    }
    
    open func getSecondaryBubble() -> Bubble
    {
        let newBubble = StackedBubble()
        newBubble.hasLayerMask = isMasked
        return newBubble
    }
}
