//
//  button.swift
//  teamFit
//
//  Created by Smriti Somasundaram on 12/5/22.
//
import UIKit

//Creating the gradient buttons for the workout page
@IBDesignable
public class buttonView: UIButton {
    public override class var layerClass: AnyClass         { CAGradientLayer.self }
    private var gradientLayer: CAGradientLayer             { layer as! CAGradientLayer }

    
    //setting the top color and bottom color
    @IBInspectable public var start: UIColor = .white {
        didSet {
            gradientColors()
            
        }
        
    }
    @IBInspectable public var end: UIColor = .white     {
        didSet {
            gradientColors()
        }
    }
//curving the buttons to be more rounded
    @IBInspectable public var radius: CGFloat {
        get { layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }

    // init methods

    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        gradientColors()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        gradientColors()
    }
}
//creating a gradient when the colors have changed
private extension buttonView {
    func gradientColors() {
        gradientLayer.colors = [start.cgColor, end.cgColor]
    }
}
