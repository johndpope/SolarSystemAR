//
//  SolarObject.swift
//  SolarSystemAR
//
//  Created by Jay Lees on 06/06/2017.
//  Copyright © 2017 Jay Lees. All rights reserved.
//

import UIKit
import SceneKit

class SolarObject{
    var name: String
    var imageMap: UIImage
    var radius: CGFloat
    var distanceFromCamera: Double
    var node: SCNNode
    
    init(name: String, image: UIImage, radius: CGFloat, distanceFromCamera: Double) {
        self.name = name
        self.imageMap = image
        self.radius = radius
        self.distanceFromCamera = -distanceFromCamera
        let sphere = SCNSphere(radius: radius)
        sphere.firstMaterial!.diffuse.contents = self.imageMap
        let node = SCNNode(geometry: sphere)
        node.position = SCNVector3Make(0, 0, Float(-distanceFromCamera))
        self.node = node
    }
}
