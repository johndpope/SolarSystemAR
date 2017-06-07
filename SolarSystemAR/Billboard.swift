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
    
    convenience init(text: String, planet: Planet) {
        
        self.init()
        
        self.text = text
        self.constraints!.append(SCNBillboardConstraint())
        
        let textNode = SCNText(string: text, extrusionDepth: 0)
        self.geometry = textNode
        
    }
    
    
}
