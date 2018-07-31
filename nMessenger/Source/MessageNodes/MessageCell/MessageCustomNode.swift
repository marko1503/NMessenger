//
//  MessageCustomNode.swift
//  nMessenger
//
//  Created by Pavel on 24.10.17.
//  Copyright © 2017 Ebay Inc. All rights reserved.
//

import UIKit
import AsyncDisplayKit

//MARK: MessageNode
/**
 Base message class for N Messenger. Extends GeneralMessengerCell. Holds one message
 */
open class MessageCustomNode: GeneralMessengerCell {
    
    // MARK: Public Variables
    open weak var delegate: MessageCellProtocol?
    
    /** ASDisplayNode as the content of the cell*/
    open var contentNode: ContentNode? {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    /** Message offset from edge (edge->offset->message content). Defaults to 10*/
    open var messageOffset: CGFloat = 10 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    /** Spacing under the header. Defaults to 10*/
    open var headerSpacing: CGFloat = 5 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    /** Spacing above the footer. Defaults to 10*/
    open var footerSpacing: CGFloat = 2 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    /** Message width in relation to the NMessenger container size. **Warning:** Raises a fatal error if this value is not within the range. Defaults to 2/3*/
    open var maxWidthRatio: CGFloat = 2/3 {
        didSet {
            if self.maxWidthRatio > 1 || self.maxWidthRatio < 0 {fatalError("maxWidthRatio expects a value between 0 and 1!")}
            self.setNeedsLayout()
        }
    }
    
    /** Max message height. Defaults to 100000.0 */
    open var maxHeight: CGFloat = 10000.0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    open var state:ContentNodeState = .none {
        didSet {
            self.contentNode?.state = state
        }
    }
    
    // MARK: Initializers
    
    /**
     Initialiser for the cell
     */
    public init(content: ContentNode) {
        super.init()
        self.setupMessageNode(withContent: content)
    }
    
    
    // MARK: Initializer helper method
    
    /**
     Creates background node and avatar node if they do not exist
     */
    fileprivate func setupMessageNode(withContent content: ContentNode)
    {
        
        self.contentNode = content
        self.automaticallyManagesSubnodes = true
    }
    
    // MARK: Override AsycDisaplyKit Methods
    
    func createSpacer() -> ASLayoutSpec{
        let spacer = ASLayoutSpec()
        spacer.style.flexGrow = 0
        spacer.style.flexShrink = 0
        spacer.style.minHeight = ASDimension(unit: .points, value: 0)
        return spacer
    }
    
    /**
     Overriding layoutSpecThatFits to specifiy relatiohsips between elements in the cell
     */
    override open func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        var layoutSpecs: ASLayoutSpec!            
        contentNode?.style.maxWidth = ASDimension(unit: .points, value: UIScreen.main.bounds.size.width)
        contentNode?.style.maxHeight = ASDimension(unit: .points, value: self.maxHeight)
            
        contentNode?.style.flexGrow = 1
            
        let contentSizeLayout = ASAbsoluteLayoutSpec()
        contentSizeLayout.sizing = .sizeToFit
        contentSizeLayout.children = [self.contentNode!]
            
        layoutSpecs = ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .center, alignItems: .end, children: [createSpacer(), contentSizeLayout])
        contentSizeLayout.style.flexShrink = 1
        
        let cellOrientation = [createSpacer(), layoutSpecs!]
        let layoutSpecs2 = ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .center, alignItems: .end, children: cellOrientation)
        return ASInsetLayoutSpec(insets: self.cellPadding, child: layoutSpecs2)
    }
    
    
    // MARK: UILongPressGestureRecognizer Override Methods
    
    /**
     Overriding didLoad to add UILongPressGestureRecognizer to view
     */
    override open func didLoad() {
        super.didLoad()
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(messageNodeLongPressSelector(_:)))
        view.addGestureRecognizer(longPressRecognizer)
    }
    
    /**
     Overriding canBecomeFirstResponder to make cell first responder
     */
    override open func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    /**
     Overriding touchesBegan to make to close UIMenuController
     */
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if UIMenuController.shared.isMenuVisible == true {
            UIMenuController.shared.setMenuVisible(false, animated: true)
        }
    }
    
    /**
     Overriding touchesEnded to make to handle events with UIMenuController
     */
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if UIMenuController.shared.isMenuVisible == false {
            
        }
    }
    /**
     Overriding touchesCancelled to make to handle events with UIMenuController
     */
    override open func touchesCancelled(_ touches: Set<UITouch>?, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        if UIMenuController.shared.isMenuVisible == false {
            
        }
    }
    
    
    // MARK: UILongPressGestureRecognizer Selector Methods
    
    /**
     UILongPressGestureRecognizer selector
     - parameter recognizer: Must be an UITapGestureRecognizer.
     Can be be overritten when subclassed
     */
    @objc open func messageNodeLongPressSelector(_ recognizer: UITapGestureRecognizer) {
        contentNode?.messageNodeLongPressSelector(recognizer)
    }
}

