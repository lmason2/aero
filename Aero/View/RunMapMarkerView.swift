//
//  RunMapMarkerView.swift
//  Aero
//
//  Created by Luke Mason on 1/1/22.
//

import SwiftUI

struct RunMapMarkerView: View {
    @State private var isShowingRunDetails: Bool = true
    var location: RunLocation
    
    var body: some View {
        ZStack {
            if isShowingRunDetails {
                Text(location.data)
                    .font(.footnote)
                    .foregroundColor(Color.white)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .frame(width: 80, height: 30)
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.5)) {
                            isShowingRunDetails = false
                        }
                    }
            }
            else {
                Circle()
                    .fill(Color.accentColor)
                    .frame(width: 34, height: 34)
                
                Image("luke-training")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.5)) {
                            isShowingRunDetails = true
                        }
                        
                    }
            }
            
        } //: ZSTACK
    }
}

struct RunMapMarkerView_Previews: PreviewProvider {
    static let location = RunLocation(id: UUID(), data: "8 miles", image: "", latitude: 33.374164, longitude: -111.985465)
    static var previews: some View {
        RunMapMarkerView(location: location)
    }
}
