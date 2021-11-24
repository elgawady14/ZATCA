//
//  ContentView.swift
//  ZATCA
//
//  Created by Ahmed Abduljawad on 23/11/2021.
//

import SwiftUI

struct ContentView: View {
    var qrCodegenerator = ZatcaQRCodeGenerator(tags: [
        ZatcaQRCodeTag(tag: .SellerNameTag, value: "Jawad"),
        ZatcaQRCodeTag(tag: .VatIdTag, value: "123456789"),
        ZatcaQRCodeTag(tag: .DateTimeTag, value: "2021-11-24T11:11:11Z"),
        ZatcaQRCodeTag(tag: .InvoiceTotalWithVatTag, value: "100.00"),
        ZatcaQRCodeTag(tag: .InvoiceVatTag, value: "15.00"),
    ])
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 50) {
                Spacer()
                VStack(spacing: 20) {
                    Text("ZATCA QR CODE")
                        .font(.headline)
                    if qrCodegenerator.qrCodeImage != nil {
                        Image(systemName: "qrcode.viewfinder")
                            .resizable()
                            .frame(width: proxy.size.width - 60, height: proxy.size.height * 0.5)
                    } else {
                        Image(systemName: "qrcode.viewfinder")
                            .resizable()
                            .frame(width: 300, height: 300)
                    }
                }
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Base64 Encoded String:")
                    HStack {
                        Text(qrCodegenerator.base64EncodedString ?? "⚠️")
                            .foregroundColor(Color.secondary)
                        Image(systemName: "doc.on.clipboard")
                    }
                }
                Spacer()
                
            }
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
