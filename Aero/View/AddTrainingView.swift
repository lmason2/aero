//
//  AddTrainingView.swift
//  Aero
//
//  Created by Luke Mason on 1/1/22.
//

import SwiftUI
import MapKit

struct AddTrainingView: View {
    @State private var mileage = ""
    @State private var minutes = ""
    @State private var elevation = ""
    @State private var selectedDate = Date()
    @State private var style = 0
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.493006, longitude: -111.919740), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        VStack(alignment: .center) {
            Text("New Training")
                .font(.title)
                .fontWeight(.bold)
                .background(
                    Color.accentColor
                        .frame(height: 3)
                        .offset(y: 20)
                )
            
            HStack(alignment: .center, spacing: 10) {
                Menu {
                    Button {
                        style = 0
                    } label: {
                        Text("Easy")
                        Image(systemName: "arrow.down.right.circle")
                    }
                    Button {
                        style = 1
                    } label: {
                        Text("Workout")
                        Image(systemName: "arrow.up.and.down.circle")
                    }
                    Button {
                        style = 2
                    } label: {
                        Text("Long Run")
                        Image(systemName: "arrow.up.and.down.circle")
                    }
                    Button {
                        style = 3
                    } label: {
                        Text("Race")
                        Image(systemName: "arrow.up.and.down.circle")
                    }
                }
                label: {
                    HStack {
                        Text("Type")
                           .padding(5)
                           .foregroundColor(Color.black)
                        
                        Image(systemName: "chevron.down")
                    }
                    .padding(.leading, 3)
                    .padding(.trailing, 3)
                }
                .background(Color(.systemGray5))
                .cornerRadius(5)
                .padding()
                
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .padding()
                    .labelsHidden()
                    .clipped()
            }
            
            HStack() {
                TextField("Mileage", text: $mileage)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .keyboardType(.decimalPad)
                
                TextField("Minutes", text: $minutes)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .keyboardType(.numberPad)
                
                TextField("Elevation", text: $elevation)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .keyboardType(.decimalPad)
            }
            Map(coordinateRegion: $region)
                .cornerRadius(10)
                .padding()
                .shadow(radius: 10)
            
            Button(action: {
                print("hello")
            }) {
                Text("Save")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
            }
            .background(
                Color.accentColor
            )
            .cornerRadius(20)
            .padding(.bottom, 10)
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct AddTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        AddTrainingView()
    }
}
