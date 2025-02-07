import SwiftUI

struct CircularImage: View {
    var image: Image
    
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircularImage(image: Image("turtlerock"))
}
