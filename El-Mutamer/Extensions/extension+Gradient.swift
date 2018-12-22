
import UIKit

extension UIColor {
    convenience init(_ hex: UInt) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

typealias GradientType = (x: CGPoint, y: CGPoint)

enum GradientPoint {
    case leftRight
    case rightLeft
    case topBottom
    case bottomTop
    case topLeftBottomRight
    case bottomRightTopLeft
    case topRightBottomLeft
    case bottomLeftTopRight

    func draw() -> GradientType {
        switch self {
        case .leftRight:
            return (x: CGPoint(x: 0, y: 0.5), y: CGPoint(x: 1, y: 0.5))
        case .rightLeft:
            return (x: CGPoint(x: 1, y: 0.5), y: CGPoint(x: 0, y: 0.5))
        case .topBottom:
            return (x: CGPoint(x: 0.5, y: 0), y: CGPoint(x: 0.5, y: 1))
        case .bottomTop:
            return (x: CGPoint(x: 0.5, y: 1), y: CGPoint(x: 0.5, y: 0))
        case .topLeftBottomRight:
            return (x: CGPoint(x: 0, y: 0), y: CGPoint(x: 1, y: 1))
        case .bottomRightTopLeft:
            return (x: CGPoint(x: 1, y: 1), y: CGPoint(x: 0, y: 0))
        case .topRightBottomLeft:
            return (x: CGPoint(x: 1, y: 0), y: CGPoint(x: 0, y: 1))
        case .bottomLeftTopRight:
            return (x: CGPoint(x: 0, y: 1), y: CGPoint(x: 1, y: 0))
        }
    }
}

class GradientLayer : CAGradientLayer {
    var gradient: GradientType? {
        didSet {
            startPoint = gradient?.x ?? CGPoint.zero
            endPoint = gradient?.y ?? CGPoint.zero
        }
    }
}

class GradientView: UIView {
    override public class var layerClass: Swift.AnyClass {
        get {
            return GradientLayer.self
        }
    }
}

protocol GradientViewProvider {
    associatedtype GradientViewType
}

extension GradientViewProvider where Self: UIView {
    var gradientLayer: Self.GradientViewType {
        return layer as! Self.GradientViewType
    }
}

extension UIView: GradientViewProvider {
    typealias GradientViewType = GradientLayer
}

extension UIView {
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }

    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
       // gradient.frame = bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0, y: 0)

        gradient.frame = self.bounds
        gradient.mask = self.layer.mask
        gradient.position = CGPoint(x: frame.maxY, y: frame.maxY)
       // self.layer.mask = gradient
        self.layer.insertSublayer(gradient, at: 0)
    }
}


//////////////////          NEW
struct Gradient {
    var colors: [CGColor]
    var locations: [NSNumber]? = nil
    var startPoint: CGPoint?
    var endPoint: CGPoint?

    init(colors: [CGColor], locations: [NSNumber]? = nil, startPoint: CGPoint? = CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint? = CGPoint(x: 0.5, y: 1.0)) {
        self.colors = colors
        self.locations = locations
        self.startPoint = startPoint
        self.endPoint = endPoint
    }

    var asLayer: CAGradientLayer {
        let gradientLayer = CAGradientLayer()

        gradientLayer.colors = colors
        gradientLayer.locations = locations

        if let startPoint = startPoint {
            gradientLayer.startPoint = startPoint
        }

        if let endPoint = endPoint {
            gradientLayer.endPoint = endPoint
        }

        return gradientLayer
    }
}

extension UIView {

    func add(gradient: Gradient, at: Int = 0) {
        let gradientLayer = gradient.asLayer

        gradientLayer.frame = bounds

        layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UIView {
    func applyGradienttt(colours: [UIColor]) -> Void {
        clipsToBounds = true
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}


