import SwiftUI

struct DetailView: View {
    @Binding var restaurant: Restaurant
    
    @State private var data = Restaurant.Data()
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Text("Restaurant info")
            Section(header: Text("Products")) {
                ForEach(restaurant.products) { product in
                    Label(product.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(restaurant.name)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(restaurant.name)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                restaurant.update(from: data)
                            }
                        }
                    }
            }
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(restaurant:.constant(Restaurant.sampleData[0]))
        }
    }
}

