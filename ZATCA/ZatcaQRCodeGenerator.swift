//
//  ZatcaQRCodeGenerator.swift
//  ZATCA
//
//  Created by Ahmed Abduljawad on 23/11/2021.
//

import Foundation
import SwiftUI
public class ZatcaQRCodeTag {
    public let tag: Tag
    public let value: String
    public init(tag: Tag, value: String) {
        self.tag = tag
        assert(value.utf8.count < 256, "The length of `value` needs to be less than 256.")
        self.value = value
    }
    public var length: UInt8 { UInt8(value.utf8.count) }
    public var tlv: [UInt8] { return [UInt8(tag.rawValue)!, length] + [UInt8](value.utf8) }
}

public class ZatcaQRCodeGenerator {
    private var tags: [ZatcaQRCodeTag] = []
    var tlvs: [UInt8] = []
    
    init(tags: [ZatcaQRCodeTag]) {
        tags.forEach { tag in
            /// Append [UInt8] arrays into one array.
            tlvs += tag.tlv
        }
    }
    
    public var base64EncodedString: String? {
        guard !tlvs.isEmpty else { return nil }
        return Data(tlvs).base64EncodedString()
    }
    
    public var qrCodeImage: UIImage? {
        guard !tlvs.isEmpty, let encodedString = base64EncodedString else { return nil }
        return encodedString.getQrCodeImage()
    }
}

