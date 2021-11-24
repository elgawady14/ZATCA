//
//  String+Extensions.swift
//  ZATCA
//
//  Created by Ahmed Abduljawad on 23/11/2021.
//

import SwiftUI

public enum Tag: String {
    // ZATCA QR CODE
    case SellerNameTag = "1"
    case VatIdTag = "2"
    case DateTimeTag = "3"
    case InvoiceTotalWithVatTag = "4"
    case InvoiceVatTag = "5"
}

extension String {
    
    func getQrCodeImage() -> UIImage? {
        let data = data(using: String.Encoding.ascii)
        if let QRFilter = CIFilter(name: "CIQRCodeGenerator") {
            QRFilter.setValue(data, forKey: "inputMessage")
            guard let QRImage = QRFilter.outputImage else {return nil}
            let transformScale = CGAffineTransform(scaleX: 5.0, y: 5.0)
            let scaledQRImage = QRImage.transformed(by: transformScale)
            return UIImage(ciImage: scaledQRImage)
        }
        return nil
    }
}
