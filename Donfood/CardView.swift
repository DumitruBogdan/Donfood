import SwiftUI

struct CardView: View {
    let restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(restaurant.name)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Label("\(restaurant.products.count)", systemImage: "person.3")
                    .accessibilityLabel("\(restaurant.products.count) products")
                Spacer()
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(.yellow)
    }
}

struct CardView_Previews: PreviewProvider {
    static var restaurant = Restaurant.sampleData[0]
    static var previews: some View {
        CardView(restaurant: restaurant)
            .background(.yellow)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
