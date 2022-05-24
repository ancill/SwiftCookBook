import PlaygroundSupport
import UIKit


// размеры прямоугольной области
let sizeOfArea = CGSize(width: 400, height: 400)
// создание экземпляра
var area = SquareArea(size: sizeOfArea, color: #colorLiteral(red: 0.3885842822, green: 0.298565976, blue: 0.5434928973, alpha: 1))
// установка экземпляра в качестве текущего отображения
PlaygroundPage.current.liveView = area
