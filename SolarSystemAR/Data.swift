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


let mercury = Planet(planetName: "Mercury", image: UIImage(named:"2k_mercury.jpg")!, radius: 0.025, distanceFromCamera: 0.1)
let venus = Planet(planetName: "Venus", image: UIImage(named:"2k_venus_surface.jpg")!, radius: 0.05, distanceFromCamera: 0.3)
let earth = Planet(planetName: "Earth", image: UIImage(named:"2k_earth_daymap.jpg")!, radius: 0.1, distanceFromCamera: 0.6)
let mars = Planet(planetName: "Mars", image: UIImage(named: "2k_mars.jpg")!, radius: 0.2, distanceFromCamera: 0.95)
let jupiter = Planet(planetName: "Jupiter", image: UIImage(named: "2k_jupiter.jpg")!, radius: 0.4, distanceFromCamera: 1.3)
let saturn = Planet(planetName: "Saturn", image: UIImage(named: "2k_saturn.jpg")!, radius: 0.6, distanceFromCamera: 2.25)
let uranus = Planet(planetName: "Uranus", image: UIImage(named: "2k_uranus.jpg")!, radius: 0.5, distanceFromCamera: 3.0)
let neptune = Planet(planetName: "Neptune", image: UIImage(named: "2k_neptune.jpg")!, radius: 0.7, distanceFromCamera: 3.5)

let allPlanets = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune]
