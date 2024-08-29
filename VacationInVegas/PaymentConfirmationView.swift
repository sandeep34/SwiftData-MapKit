import SwiftUI

struct PaymentConfirmationView: View {
    @State private var willMoveToNextScreen = false
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Spacer()
                Text("Venmo")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            .background(Color.blue)
            
            // Title
            Text("Purchases CX to charge Venmo for Future Purchases")
                .font(.headline)
                .padding()
            
            // Card Information
            ForEach(0..<3) { _ in
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.gray.opacity(0.2), lineWidth: 1)
                        .background(Color.white)
                    HStack {
                        VStack {
                            Image(systemName: "creditcard.fill")
                                .foregroundColor(.blue)
                            Spacer()
                        }
                        VStack {
                            HStack {
                                Text("Visa ****7754")
                                    .font(.subheadline)
                                Spacer()
                            }
                            HStack {
                                Text("Expiry Date: 12/23")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                        }
                    }
                    .padding()
                }
            }
            Spacer()
            // Buttons
            VStack(spacing: 10) {
                Button(action: {
                    willMoveToNextScreen.toggle()
                }) {
                    Text("Agree & Continue")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                Button(action: {
                    // Cancel action
                }) {
                    Text("Cancel")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .cornerRadius(5)
                        .border(.blue, width: 1)
                }
            }
            .navigationDestination(isPresented: $willMoveToNextScreen) {
                PaymentMethodView()
            }
        }
        .padding()
    }
}
struct CardView: View {
    private(set) var text: String
    
    var body: some View {
        ZStack(alignment: .center) {
            let rect = RoundedRectangle(cornerRadius: 20)
            rect.fill().foregroundColor(.white)
            rect.strokeBorder(.blue, lineWidth: 2)
        }
    }
}
