//
//  Planet.swift
//  SolarSystemAR
//
//  Created by Jay Lees on 06/06/2017.
//  Copyright © 2017 Jay Lees. All rights reserved.
//

import UIKit
import SceneKit

class Planet: SolarObject {
    
    //Given a time interval, animate the planet's rotation around the sun (in a circle)
    private func createAction(duration: TimeInterval) -> SCNAction {
        var arrayOfMoves = [SCNAction]()
        var theta = 0.0
        while theta < 2*Double.pi {
            let newX = cos(theta) * distanceFromCamera
            let newY = sin(theta) * distanceFromCamera
            arrayOfMoves.append(SCNAction.move(to: (SCNVector3Make(Float(newX), 0, Float(newY))), duration: duration))
            theta += 0.1
        }
        
        return SCNAction.repeatForever(SCNAction.sequence(arrayOfMoves))
    }
    
    //Call the create action function on the node that then execute the action
    func animate(withTime: TimeInterval){
        node.runAction(createAction(duration: withTime))
    }
}
