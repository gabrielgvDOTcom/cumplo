//
//  Style.swift
//  weeKGKit
//
//  Created by Gabriel Gárate Vivanco on 2/22/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

public struct Style {
    
    public struct Text {

        let font: UIFont
        let color: UIColor

        public init(font: UIFont, color: UIColor) {
            self.font = font
            self.color = color
        }
    }
    public struct Image {

        public init() {}
    }
    public struct View {
        
        let bgColor: UIColor
        let cornerRadius: CGFloat
        
        public init(bgColor: UIColor, corner: CGFloat) {
            self.bgColor = bgColor
            self.cornerRadius = corner
        }
    }
    public struct Button {

        let font: UIFont
        let image: UIImage?
        let bgColor: UIColor
        let tintColor: UIColor
        let cornerRadius: CGFloat

        public init(font: UIFont, bgColor: UIColor, tintColor: UIColor, corner: CGFloat, image: UIImage?) {
            self.font = font
            self.image = image
            self.bgColor = bgColor
            self.tintColor = tintColor
            self.cornerRadius = corner
        }
    }
}
