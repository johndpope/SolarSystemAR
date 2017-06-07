//
//  Billboard.swift
//  SolarSystemAR
//
//  Created by Jack Chorley on 07/06/2017.
//  Copyright © 2017 Jay Lees. All rights reserved.
//

import UIKit
import SceneKit

class Billboard: SCNNode {
    
    private var text: String!
    
    convenience init(text: String, cameraNode: SCNNode) {
        
        self.init()
        
        self.text = text
        self.constraints = [SCNLookAtConstraint(target: cameraNode)]
        
        
        let textNode = SCNText(string: text, extrusionDepth: 0.1)
        textNode.alignmentMode = kCAAlignmentCenter
        textNode.font = UIFont (name: "Arial", size: 0.1)
        
        self.geometry = textNode
        
    }
    
    
}
