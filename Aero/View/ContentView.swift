//
//  ContentView.swift
//  Aero
//
//  Created by Luke Mason on 1/1/22.
//

import SwiftUI
import CoreData
import MapKit

struct ContentView: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Activity.timestamp, ascending: false)],
        animation: .default)
    private var activities: FetchedResults<Activity>
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    // MARK: - FUNCTIONS
    private func addItem() {
        print(activities)
        withAnimation {
            let newActivity = Activity(context: viewContext)
            newActivity.timestamp = Date()
            newActivity.id = UUID()
            newActivity.mileage = 8
            newActivity.elevation = 1000
            newActivity.minutes = 60

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { activities[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack() {
                    Image("asu")
                        .resizable()
                        .scaledToFill()
                        .padding(.top, 0)
                        .frame(height: 200)
                    
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 155, height: 155)
                        
                        Image("luke-training")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                    }
                    .offset(y: 130)
                }
                .padding(.top, 20)
                .padding(.bottom, 40)
                
                HStack() {
                    Spacer()
                    NavigationLink(destination: AddTrainingView()) {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                }
                .padding()
                .frame(height: 40)
                
                Text("Luke Mason")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .background(
                        Color.accentColor
                            .frame(height: 3)
                            .offset(y: 30)
                    )
                
                HStack() {
                    Text("Distance (mi.)")
                        .font(.headline)
                        .fontWeight(.bold)
                    Divider()
                        .background(Color.accentColor)
                    Text("Time (min.)")
                        .font(.headline)
                        .fontWeight(.bold)
                    Divider()
                        .background(Color.accentColor)
                    Text("Elevation (ft.)")
                        .font(.headline)
                        .fontWeight(.bold)
                }
                
                ForEach(activities.prefix(7)) { activity in
                    NavigationLink(destination: TrainingDetailView()) {
                        VStack {
                            Divider()
                            HStack(alignment: .center, spacing: 20) {
                                Rectangle()
                                    .frame(width: 20, height: 20)
                                    .cornerRadius(2)
                                
                                VStack (alignment: .leading) {
                                    HStack(alignment: .center) {
                                        Text(decimalFormatter.string(from: activity.mileage!)!)
                                        Divider()
                                            .background(Color.accentColor)
                                        Text("\(activity.minutes)")
                                        Divider()
                                            .background(Color.accentColor)
                                        Text(decimalFormatter.string(from: activity.elevation!)!)
                                    }
                                
                                
                                    Text("\(activity.timestamp!, formatter: activityFormatter)")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                } //: LIST ITEM
                                
                                Spacer()
                                
                                Image(systemName: "chevron.forward")
                                    .padding()
                            }
                            .padding(.leading, 10)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                HStack() {
                    Spacer()
                    
                    NavigationLink(destination: AllTrainingView()) {
                        Image(systemName: "arrow.right.square")
                            .foregroundColor(Color.accentColor)
                            .font(.title)
                    }
                }
                .padding()
                
            } //: SCROLLVIEW
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
