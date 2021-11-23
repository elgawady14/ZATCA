//
//  ContentView.swift
//  ZATCA
//
//  Created by Ahmed Abduljawad on 23/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 50) {
                Spacer()
                VStack(spacing: 20) {
                    Text("ZATCA QR CODE")
                    
                    Image(systemName: "qrcode.viewfinder")
                        .resizable()
                        .frame(width: 300, height: 300)
                }
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Base64 Encoded String:")
                    
                    HStack {
                        Text("AQVTYWxsYQIKMTIzNDU2Nzg5MQMUMjAyMS0wNy0xMlQxNDoyNTowOVoEBjEwMC4wMAUFMTUuMDA=")
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
