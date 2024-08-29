import SwiftUI

struct PaymentMethodView: View {
    @State private var cardHolderName = ""
    @State private var cardNumber = ""
    @State private var expiryMonth = ""
    @State private var expiryYear = ""
    @State private var cvv = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var streetAddress = ""
    @State var isForFututre: Bool = true
    @State var isDefaultPayment: Bool = true
    @State var isStandard: Bool = true
    @State var isPOBox: Bool = true

    var body: some View {
            Form {
                Section(header: Text("Accepted Card Types")) {
                    HStack {
                        Image(systemName: "creditcard")
                        Text("Visa")
                        Image(systemName: "creditcard.fill")
                        Text("MasterCard")
                    }
                }
                
                Section(header: Text("Card Details")) {
                    VStack {
                        TextField("Name on Card", text: $cardHolderName)
                            .textFieldStyle(.roundedBorder)
                        TextField("Card Number", text: $cardNumber)
                            .textFieldStyle(.roundedBorder)
                        HStack(spacing: 10) {
                            TextField("MM", text: $expiryMonth)
                                .textFieldStyle(.roundedBorder)
                            TextField("YY", text: $expiryYear)
                                .textFieldStyle(.roundedBorder)
                            TextField("CVV", text: $cvv)
                                .textFieldStyle(.roundedBorder)
                        }
                        CheckBoxView(text: "Remember Payment Option for future use", checked: $isForFututre)
                        CheckBoxView(text: "Make this my default Payment method", checked: $isDefaultPayment)
                    }
                }
                
                Section(header: Text("Billing Address")) {
                    VStack {
                        HStack {
                            CheckBoxView(text: "Standard",
                                         checked: $isStandard,
                                         selelctedImageName: "checkmark.circle.fill",
                                         normalImageName: "circle")
                            CheckBoxView(text: "P.O. Box",
                                         checked: $isPOBox,
                                         selelctedImageName: "checkmark.circle.fill",
                                         normalImageName: "circle")
                        }
                        HStack {
                            TextField("First Name", text: $firstName)
                                .textFieldStyle(.roundedBorder)
                            TextField("Last Name", text: $lastName)
                                .textFieldStyle(.roundedBorder)
                        }
                        TextField("Street Address", text: $streetAddress)
                            .textFieldStyle(.roundedBorder)
                    }
                }
                .listSectionSeparator(.hidden, edges: [.top, .bottom])
                
                HStack(spacing: 10) {
                    Button(action: {
                        // Cancel action
                    }) {
                        Text("Cancel")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .cornerRadius(5)
                            .border(.blue, width: 1)
                    }
                    Button(action: {
                        // Save action
                    }) {
                        Text("Save")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
                .padding()
            }
            .navigationBarTitle(Text("Add a Payment Method"), displayMode: .inline)
    }
}

struct CheckBoxView: View {
    private let selelctedImageName: String
    private let normalImageName: String
    private let text: String
    @Binding var checked: Bool
    
    init(text: String,
         checked: Binding<Bool>,
         selelctedImageName: String = "checkmark.square.fill",
         normalImageName: String = "square") {
        self.text = text
        self._checked = checked
        self.selelctedImageName = selelctedImageName
        self.normalImageName = normalImageName
    }

    var body: some View {
        HStack {
            Image(systemName: checked ? selelctedImageName : normalImageName)
                .foregroundColor(checked ? Color.blue : Color.gray)
                .onTapGesture {
                    self.checked.toggle()
                }
            Text(text)
                .font(.system(size: 12))
            Spacer()
        }
    }
}
