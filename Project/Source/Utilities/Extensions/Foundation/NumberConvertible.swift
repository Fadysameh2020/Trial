//
//  NumberConvertible.swift
//  Foundation-DD
//
//  Created by Mohamed Gamal on 9/2/18.
//

import Foundation

public protocol NumberConvertible {
    init (_ value: Int)
    init (_ value: Float)
    init (_ value: Double)
    init (_ value: CGFloat)
}

extension CGFloat : NumberConvertible {}
extension Double  : NumberConvertible {}
extension Float   : NumberConvertible {}
extension Int     : NumberConvertible {}


public extension NumberConvertible {
    
    var c:CGFloat{
        return convert()
    }
    
    private func convert<T: NumberConvertible>() -> T {
        switch self {
        case let x as CGFloat:
            return T(x) //T.init(x)
        case let x as Float:
            return T(x)
        case let x as Double:
            return T(x)
        case let x as Int:
            return T(x)
        default:
            assert(false, "NumberConvertible convert cast failed!")
            return T(0)
        }
    }
    
    var abs: CGFloat {
        return Swift.abs(c)
    }
    
    var ceil: CGFloat {
        return Foundation.ceil(c)
    }
    
    var degreesToRadians: CGFloat {
        return .pi * c / 180.0
    }
    
    var floor: CGFloat {
        return Foundation.floor(c)
    }
    
    var isPositive: Bool {
        return c > 0
    }
    
    var isNegative: Bool {
        return c < 0
    }
    
}

public extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
