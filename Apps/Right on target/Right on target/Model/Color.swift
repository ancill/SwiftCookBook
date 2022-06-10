import Foundation
import UIKit




/*:
 The call to getRed(:green:blue:alpha:) is a built-in call that returns values between 0 and 1 for each of those channels.

 These are then normalised into a value between 0 and 255, and subsequently converted into three hex strings (using %02X, which means to display an integer in upper-case base 16, with 0-padding up to 2 digits).

*/
extension UIColor {
    var toHexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return String(
            format: "%02X%02X%02X",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }
}
/*:
 This function is a bit more complex. It begins by using Scanner to convert the hex string (assumed to be 6 digits long) into an integer.

 Using bitmasks and bit shifting, the red, green and blue values are extracted and normalised into values between 0 and 255.

 These values are divided by 255 (0x55) to turn them back into a value between 0 and 1, which is then compatible with the existing UIColor.init(red:green:blue:) function.

 Note that this code assumes an alpha channel value of 1.0 at all times.
 */

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)

        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

extension BinaryInteger {
    var binary: String { .init(self, radix: 2) }
    var hexa: String { .init(self, radix: 16) }
}
