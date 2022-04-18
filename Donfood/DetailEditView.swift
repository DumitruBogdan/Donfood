import SwiftUI

struct DetailEditView: View {
    @Binding var data: Restaurant.Data
    @State private var newProductName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Restaurant info")) {
                TextField("Name", text: $data.name)
                    Spacer()
                TextField("Phone number", text: $data.phoneNumber)
                }
            Section(header: Text("Products")) {
                ForEach(data.products) { product in
                    Text(product.name)
                }
                .onDelete { indices in
                    data.products.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Product", text: $newProductName)
                    Button(action: {
                        withAnimation {
                            let product = Restaurant.Product(name: newProductName)
                            data.products.append(product)
                            newProductName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newProductName.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(Restaurant.sampleData[0].data))
    }
}

