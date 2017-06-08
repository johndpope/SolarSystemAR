//
//  Planet.swift
//  SolarSystemAR
//
//  Created by Jay Lees on 06/06/2017.
//  Copyright © 2017 Jay Lees. All rights reserved.
//

import UIKit
import SceneKit

class Planet: SCNNode {
    var planetName: String
    var imageMap: UIImage
    var radius: CGFloat
    var distanceFromCamera: Double
    var animationTime: Int
    
    var arrayOfMoves = [SCNAction]()
    var moveIndex = 0
    
    init(planetName: String, image: UIImage, radius: CGFloat, distanceFromCamera: Double, animationTime: Int) {
        self.planetName = planetName
        self.imageMap = image
        self.radius = radius
        self.distanceFromCamera = distanceFromCamera
        self.animationTime = animationTime
        super.init()
        let sphere = SCNSphere(radius: radius)
        sphere.firstMaterial!.diffuse.contents = self.imageMap
        self.geometry = sphere
        self.position = SCNVector3Make(0, 0, Float(-distanceFromCamera))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createBillboard(cameraNode: SCNNode) {
        let billboard = Billboard(text: "Hello", cameraNode: cameraNode)
        billboard.position.y = 0.01
        self.addChildNode(billboard)
    }
    
    
    //Given a time interval, animate the planet's rotation around the sun (in a circle)
    private func createAction(duration: TimeInterval) -> SCNAction {
        var theta = 0.0
        while theta < 2*Double.pi {
            let newX = cos(theta) * distanceFromCamera
            let newY = sin(theta) * distanceFromCamera
            arrayOfMoves.append(SCNAction.move(to: (SCNVector3Make(Float(newX), 0, Float(newY))), duration: duration/600))
            theta += 0.01
        }
        return SCNAction.repeatForever(SCNAction.customAction(duration: duration/600) { (node, time) in
            self.moveIndex += 1
            if self.moveIndex >= self.arrayOfMoves.count {
                self.moveIndex = 0
            }
            node.runAction(self.arrayOfMoves[self.moveIndex])
        })
    }
    
    //Call the create action function on the node that then execute the action
    func animate(){
        self.runAction(createAction(duration: TimeInterval(animationTime)))
    }
    
    func createPath() -> SCNNode {
        let torus = SCNTorus(ringRadius: CGFloat(distanceFromCamera), pipeRadius: 0.005)
        let torusNode = SCNNode(geometry: torus)
        torusNode.opacity = 0.7
        torus.firstMaterial?.diffuse.contents  = UIColor.gray
        torusNode.position = SCNVector3Make(0, 0, 0)
        return torusNode
    }
    
    func addRing(texture: String) {
        let ring = SCNTube(innerRadius: radius + 0.1, outerRadius: radius + 0.26, height: 0.005)
        ring.firstMaterial?.diffuse.contents = UIImage(named: texture)!
        let ringNode = SCNNode(geometry: ring)
        self.addChildNode(ringNode)
    }
}
