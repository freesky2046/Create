//
//  ProgressView.swift
//  ProgressView
//
//  Created by 周明 on 2024/4/21.
//

import UIKit


class ProgressView: UIView {

    var value: CGFloat = 0.0 {
        didSet {
            #if DEBUG
                fatalError("value值只能在 0 和 1 之间")
            #endif
            setNeedsLayout()
        }
    }
    
    var minimumTrackTintColor: CGColor = UIColor.gray.cgColor {
        didSet {
            progressLine.backgroundColor = minimumTrackTintColor
        }
    }
    var maximumTrackTintColor: CGColor = UIColor.black.cgColor {
        didSet {
            totalLine.backgroundColor = maximumTrackTintColor
        }
    }
    var progressHeight: CGFloat = 1.0


    private var panGesture: UIPanGestureRecognizer!
    private lazy var progressLine: CALayer = CALayer()
    private lazy var totalLine: CALayer = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        layer.addSublayer(totalLine)
        layer.addSublayer(progressLine)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let height = self.bounds.size.height
        let width = self.bounds.size.width
        let lineHeight = progressHeight
        let y = height * 0.5 - lineHeight * 0.5
        let progressWidth = width * value
        totalLine.frame = CGRect(x: 0, y: y , width: width, height: progressHeight)
        progressLine.frame = CGRect(x: 0, y: y , width: progressWidth, height: progressHeight)
    }

}



