//
//  AudioIndicatorBars.swift
//  AudioIndicatorBars
//
//  Created by Leonardo Cardoso on 16/09/2016.
//  Copyright © 2016 leocardz.com. All rights reserved.
//

import Foundation
import UIKit

open class AudioIndicatorBarsView: UIView {
    
    // MARK: - Lets
    fileprivate let barsOffset: CGFloat = 2.0
    
    // MARK: - Vars
    fileprivate var barsCount = 4
    fileprivate var bars: [BarView]?
    
    // MARK: - Initializers
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    // Custom initializers
    public init(
        _ rect: CGRect,
        _ barsCount: Int = 4,
        _ cornerRadius: CGFloat = 0.0,
        _ animationSpeed: Double = 1.0,
        _ color: UIColor = UIColor.black
        ) {
        
        super.init(frame: rect)
        
        self.doDraw(rect, barsCount, cornerRadius, animationSpeed, color)
        
    }
    
    // MARK: - Functions
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // TODO check User Defined Runtime Attributes
        self.doDraw(rect)
        
    }
    
    // Do draw
    func doDraw(
        _ rect: CGRect,
        _ barsCount: Int = 4,
        _ cornerRadius: CGFloat = 0.0,
        _ animationSpeed: Double = 1.0,
        _ color: UIColor = UIColor.black
        ) {
        
        let sectionsWidth = rect.width / CGFloat(self.barsCount)
        
        for i in 0 ..< self.barsCount {
            
            let x = sectionsWidth * CGFloat(i) + self.barsOffset
            let width = sectionsWidth - self.barsOffset * 2
            
            let frame: CGRect = CGRect(x: x, y: 0.0, width: width, height: width)
            let bar: BarView = BarView(frame, cornerRadius, animationSpeed, color, rect.height)
            
            self.bars?.append(bar)
            
            self.addSubview(bar)
            
        }
        
    }
    
    
    // Start animations
    open func start() {
        
        for bar in self.bars! { bar.start() }
        
    }
    
    // Stop animations
    open func stop() {
        
        for bar in self.bars! { bar.stop() }
        
    }
    
}