//
//  HorizontalProgressBar.swift
//  KMViewsKit
//
//  Created by Konstantin Mishukov on 06.12.2023.
//  Copyright © 2023 MyCompany. All rights reserved.
//

import UIKit

public class HorizontalProgressBar: UIView {
    
    // MARK: - Properties

    public var progress: CGFloat = 0.01 {
        didSet {
            setNeedsDisplay()
        }
    }
    private let progressLayer = CALayer()
    private let activeColor: UIColor

    // MARK: - Init

    public init(
        activeColor: UIColor,
        backgroundColor: UIColor
    ) {
        self.activeColor = activeColor
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        layer.addSublayer(progressLayer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Draw

    public override func draw(_ rect: CGRect) {
        super.draw(rect)

        let backgroundMask = CAShapeLayer()
        backgroundMask.path = UIBezierPath(
            roundedRect: rect,
            cornerRadius: rect.height * 0.25
        ).cgPath
        layer.mask = backgroundMask

        let width = rect.width * progress
        let progressWidth = width > 0 ? width : 0
        let progressRect = CGRect(
            origin: .zero,
            size: CGSize(width: progressWidth, height: rect.height)
        )
        progressLayer.frame = progressRect
        progressLayer.backgroundColor = activeColor.cgColor
    }
}
