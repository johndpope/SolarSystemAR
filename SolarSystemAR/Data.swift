import SceneKit
import UIKit

enum Planets: Int {
    case Sun = 0
    case Mercury = 1
    case Venus = 2
    case Earth = 3
    case Mars = 4
    case Jupiter = 5
    case Saturn = 6
    case Uranus = 7
    case Neptune = 8
}


let mercury = Planet(name: "Mercury", image: UIImage(named:"2k_mercury.jpg")!, radius: 0.025, distanceFromCamera: 0.1)
let venus = Planet(name: "Venus", image: UIImage(named:"2k_venus_surface.jpg")!, radius: 0.05, distanceFromCamera: 0.3)
let earth = Planet(name: "Earth", image: UIImage(named:"2k_earth_daymap.jpg")!, radius: 0.1, distanceFromCamera: 0.6)
let mars = Planet(name: "Mars", image: UIImage(named: "2k_mars.jpg")!, radius: 0.2, distanceFromCamera: 0.95)
let jupiter = Planet(name: "Jupiter", image: UIImage(named: "2k_jupiter.jpg")!, radius: 0.4, distanceFromCamera: 1.3)
let saturn = Planet(name: "Saturn", image: UIImage(named: "2k_saturn.jpg")!, radius: 0.6, distanceFromCamera: 2.25)
let uranus = Planet(name: "Uranus", image: UIImage(named: "2k_uranus.jpg")!, radius: 0.5, distanceFromCamera: 3.0)
let neptune = Planet(name: "Neptune", image: UIImage(named: "2k_neptune.jpg")!, radius: 0.7, distanceFromCamera: 3.5)

let allPlanets = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune]
