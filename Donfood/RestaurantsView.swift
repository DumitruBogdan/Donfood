import SwiftUI

struct RestaurantsView: View {
    @Binding var restaurants: [Restaurant]
    @State private var isPresentingNewRestaurantView = false
    @State private var newRestaurantData = Restaurant.Data()
    
   var body: some View {
        List {
            ForEach($restaurants) { $restaurant in
                NavigationLink(destination: DetailView(restaurant: $restaurant)) {
                    CardView(restaurant: restaurant)
                }
                .listRowBackground(Color.green)
            }
        }
        .navigationTitle("Restaurants available")
        .toolbar {
            Button(action: {
                isPresentingNewRestaurantView = true
            }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New restaurant")
        }
        .sheet(isPresented: $isPresentingNewRestaurantView) {
            NavigationView {
                DetailEditView(data: $newRestaurantData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewRestaurantView = false
                                newRestaurantData = Restaurant.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newRestaurant = Restaurant(data: newRestaurantData)
                                restaurants.append(newRestaurant)
                                isPresentingNewRestaurantView = false
                                newRestaurantData = Restaurant.Data()
                            }
                        }
                    }
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantsView(restaurants: .constant(Restaurant.sampleData))
        }
    }
}
