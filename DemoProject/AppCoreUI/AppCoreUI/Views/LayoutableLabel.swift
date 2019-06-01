//
//  LayoutableLabel.swift
//  StoryView
//
//  Created by GEORGE QUENTIN on 16/03/2018.
//  Copyright © 2018 LEXI LABS. All rights reserved.
//
// https://spin.atomicobject.com/2017/08/04/swift-extending-uilabel/
// https://spin.atomicobject.com/2017/07/18/swift-interface-builder/

import UIKit

@IBDesignable
class LayoutableLabel: UILabel {
    /// When positive, the background of the layer will be drawn with rounded corners.
    /// Also effects the mask generated by the `masksToBounds' property. Defaults to zero. Animatable.

    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    /// The width of the layer's border, inset from the layer bounds.
    /// The border is composited above the layer's content and sublayers
    /// and includes the effects of the `cornerRadius' property. Defaults to zero. Animatable.
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    /// The color of the layer's border. Defaults to opaque black.
    /// Colors created from tiled patterns are supported. Animatable.
    @IBInspectable
    var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    @IBInspectable
    var rotation: Int {
        get {
            return 0
        } set {
            let radians = CGFloat(CGFloat(Double.pi) * CGFloat(newValue) / CGFloat(180.0))
            transform = CGAffineTransform(rotationAngle: radians)
        }
    }

    @IBInspectable
    var leftTextInset: CGFloat {
        set { textInsets.left = newValue }
        get { return textInsets.left }
    }

    @IBInspectable
    var rightTextInset: CGFloat {
        set { textInsets.right = newValue }
        get { return textInsets.right }
    }

    @IBInspectable
    var topTextInset: CGFloat {
        set { textInsets.top = newValue }
        get { return textInsets.top }
    }

    @IBInspectable
    var bottomTextInset: CGFloat {
        set { textInsets.bottom = newValue }
        get { return textInsets.bottom }
    }

    var textInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }

    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = bounds.inset(by: textInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top,
                                          left: -textInsets.left,
                                          bottom: -textInsets.bottom,
                                          right: -textInsets.right)
        return textRect.inset(by: invertedInsets)
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }

    // Needed to avoid IB crash during autolayout
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
