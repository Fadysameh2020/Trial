import UIKit
import ImageIO

// MARK: - Properties

public extension UIImage {
    
    var bytesSize: Int {
        return self.jpegData(compressionQuality: 1)?.count ?? 0
    }
    
    var kilobytesSize: Int {
        
        return bytesSize / 1024
    }
    
    var original: UIImage {
        
        return withRenderingMode(.alwaysOriginal)
    }
    
    var template: UIImage {
        
        return withRenderingMode(.alwaysTemplate)
    }
}

// MARK: - Methods

public extension UIImage {
    func cropped(to rect: CGRect) -> UIImage {
        guard rect.size.height < size.height && rect.size.height < size.height else {
            return self
        }
        guard let image: CGImage = cgImage?.cropping(to: rect) else { return self }
        
        return UIImage(cgImage: image)
    }
    
    func scaled(toHeight: CGFloat, opaque: Bool = false) -> UIImage? {
        let scale = toHeight / size.height
        let newWidth = size.width * scale
        UIGraphicsBeginImageContextWithOptions(CGSize(width: newWidth, height: toHeight), opaque, 0)
        draw(in: CGRect(x: 0, y: 0, width: newWidth, height: toHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func scaled(toWidth: CGFloat, opaque: Bool = false) -> UIImage? {
        let scale = toWidth / size.width
        let newHeight = size.height * scale
        UIGraphicsBeginImageContextWithOptions(CGSize(width: toWidth, height: newHeight), opaque, 0)
        draw(in: CGRect(x: 0, y: 0, width: toWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func filled(withColor color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.setFill()
        
        guard let context = UIGraphicsGetCurrentContext() else { return self }
        
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        guard let mask = self.cgImage else { return self }
        context.clip(to: rect, mask: mask)
        context.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    static func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func with(color: UIColor) -> UIImage {
        guard let cgImage = self.cgImage else {
            return self
        }
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(.normal)
        let imageRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context.clip(to: imageRect, mask: cgImage)
        color.setFill()
        context.fill(imageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func changeImageColorTint(_ color : UIColor) {
        self.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
    }
    
    func encodeImage () -> String {
        let strBase64 = self.pngData()!.base64EncodedString()
        
        return strBase64
    }
    
    func decodeImage (_ mediaFile : String) -> UIImage? {
        if let decodedData = Data(base64Encoded: mediaFile, options: .ignoreUnknownCharacters) {
            let image = UIImage(data: decodedData)
            return image
        }
        
        return nil
    }
    
    func compress(maxFileSizeInMegaBytes: Int = 2) -> Data? {
        if var imageData = self.jpegData(compressionQuality: 1.0) {
            var compression = 1.0
            let maxFileSize = maxFileSizeInMegaBytes*1024*1024
            
            while (imageData.count > maxFileSize) {
                compression = compression - 0.1
                imageData = self.jpegData(compressionQuality: CGFloat(compression))!
            }
            return imageData
        }
        
        return nil
    }
    
    func image(withTintColor color: UIColor) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(CGBlendMode.normal)
        let rect: CGRect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context.clip(to: rect, mask: self.cgImage!)
        color.setFill()
        context.fill(rect)
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
}



