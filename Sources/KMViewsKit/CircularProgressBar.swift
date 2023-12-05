//
//  CircularProgressBar.swift
//  KMViewsKit
//
//  Created by Konstantin Mishukov on 05.12.2023.
//

import UIKit

public class CircularProgressBar: UIView {

    // MARK: - Properties

    static private let defaultActive = UIColor(
        red: 63.0 / 255.0,
        green: 170.0 / 255.0,
        blue: 250.0 / 255.0,
        alpha: 1
    )
    static private let defaultBackground = UIColor.lightGray

    private let backgroundLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()
    private let activeColor: UIColor
    private let secondaryColor: UIColor
    
    var progress: CGFloat = 0.0001 {
        didSet {
            setNeedsDisplay()
        }
    }

    // MARK: - Init

    init(
        activeColor: UIColor = defaultActive,
        backgroundColor: UIColor = defaultBackground
    ) {
        self.activeColor = activeColor
        self.secondaryColor = backgroundColor
        super.init(frame: .zero)
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(progressLayer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Draw

    public override func draw(_ rect: CGRect) {
        super.draw(rect)

        let lineWidth = rect.width / Constants.lineWidthRatio

        let circularPath = UIBezierPath(
            arcCenter: CGPoint(x: rect.midX, y: rect.midY),
            radius: rect.width / 2 - lineWidth / 2,
            startAngle: -CGFloat.pi / 2,
            endAngle: CGFloat.pi / 2 * 3,
            clockwise: true)

        backgroundLayer.path = circularPath.cgPath
        backgroundLayer.fillColor = UIColor.clear.cgColor
        backgroundLayer.lineWidth = lineWidth
        backgroundLayer.strokeColor = secondaryColor.cgColor

        progressLayer.path = circularPath.cgPath
        progressLayer.lineWidth = lineWidth
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = activeColor.cgColor
        progressLayer.strokeEnd = progress
    }
}

extension CircularProgressBar {
    enum Constants {
        static let lineWidthRatio: CGFloat = 8
    }
}
