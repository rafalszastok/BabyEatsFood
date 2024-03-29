
import UIKit

enum ImageType: String {
    case front
    case ingredients
    case nutrition
    case general
}

struct ProductImage {
    let barcode: String
    let image: UIImage
    let fileName: String
    let type: ImageType
    let languageCode: String

    init?(barcode: String, image: UIImage, type: ImageType, languageCode: String) {
        self.barcode = barcode
        self.image = image
        self.fileName = "\(UUID().uuidString).jpg"
        self.type = type
        self.languageCode = languageCode

        guard saveImage(image) != nil else { return nil }
    }

    init?(barcode: String, fileName: String, type: ImageType, languageCode: String) {
        self.barcode = barcode
        self.fileName = fileName
        self.type = type
        self.languageCode = languageCode
        guard let image = ProductImage.loadImage(fileName) else { return nil }
        self.image = image
    }

    private func saveImage(_ image: UIImage) -> String? {
        guard let data = image.jpegData(compressionQuality: 1.0) else {
            return nil
        }

        do {
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let imageURL = documentsURL.appendingPathComponent(fileName)
            try data.write(to: imageURL)
            return fileName
        } catch {
            return nil
        }
    }

    private static func loadImage(_ imageName: String) -> UIImage? {
        do {
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let imageURL = documentsURL.appendingPathComponent(imageName)
            let imageData = try Data(contentsOf: imageURL)
            return UIImage(data: imageData)
        } catch {
            return nil
        }
    }

    func deleteImage() {
        do {
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let imageURL = documentsURL.appendingPathComponent(fileName)
            try FileManager.default.removeItem(at: imageURL)
        } catch {}
    }
}
