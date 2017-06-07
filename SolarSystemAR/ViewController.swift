//
//  ViewController.swift
//  SolarSystemAR
//
//  Created by Jay Lees on 06/06/2017.
//  Copyright © 2017 Jay Lees. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    var isRotating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.showsStatistics = true
        let scene = SCNScene()
        sceneView.scene = scene
        addPlanets()
        rotate()
    }
    
    func addPlanets(){
        let sphere = SCNSphere(radius: 10)
        sphere.firstMaterial!.diffuse.contents = UIImage(named: "stars.jpg")
        sphere.firstMaterial!.transparency = 0.85
        sphere.firstMaterial!.isDoubleSided = true
        sceneView.scene.rootNode.addChildNode(SCNNode(geometry: sphere))
        for planet in allPlanets{
            sceneView.scene.rootNode.addChildNode(planet)
            sceneView.scene.rootNode.addChildNode(planet.createPath())
        }
    }
    
    func rotate(){
        isRotating = true
        mercury.animate(withTime: 60)
        venus.animate(withTime: 100)
        earth.animate(withTime: 150)
        mars.animate(withTime: 200)
        jupiter.animate(withTime: 250)
        saturn.animate(withTime: 300)
        uranus.animate(withTime: 350)
        neptune.animate(withTime: 400)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingSessionConfiguration()
        sceneView.session.run(configuration)
    }
    
    @IBAction func stopRotate(_ sender: Any) {
        if isRotating {
            for planet in allPlanets {
               planet.removeAllActions()
            }
            isRotating = false
        } else {
            rotate()
        }
    }
}
