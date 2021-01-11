//
//  ContentView.swift
//  login-screen
//
//  Created by Al Ali basel on 11.01.21.
//

import SwiftUI

struct ContentView: View {
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var isEmailValid : Bool   = false
    @State private var isPasswordValid : Bool   = false
    
    @State private var showingAlert = false

    var body: some View {
        Spacer()
        VStack() {
            Text("Welcome Back!").textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.body)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(31)
                    .padding(.vertical, 16.0)
                    .shadow(radius: 20.0, x: 100, y: 100)
                    .background(
                        Image("background").resizable()
                            .frame(width: 800, height: 2000))
            
            VStack(alignment: .leading, spacing: 10) {
                TextField("E-mail", text: self.$email)
                      .padding()
                      .background(Color.black)
                      .cornerRadius(20.0)
                    .foregroundColor(.white)
                if(isEmailValid){
                    Text("Bitte geben Sie eine gültige Mailadresse!").foregroundColor(Color.red).font(.caption)
                }
                  SecureField("Password", text: self.$password)
                      .padding()
                      .background(Color.black)
                      .cornerRadius(20.0)
                    .foregroundColor(.white)
              }.padding([.leading, .trailing], 50)
            if(isPasswordValid){
                Text("Mindestens 12 Zeichen, Großbuchstaben, eine Zahl, ein Sonderzeichen enthalten").foregroundColor(Color.red).font(.caption)}
           
            
            Button(action: {
                if(email.isEmpty || !NSPredicate(format:"SELF MATCHES %@","[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}").evaluate(with: email)){
                    self.isEmailValid = true
                }else {
                    self.isEmailValid = false
                }
                
                if(!NSPredicate(format:"SELF MATCHES %@",".*[A-Z]+.*").evaluate(with: password) || !NSPredicate(format:"SELF MATCHES %@", ".*[!&^%$#@()/]+.*").evaluate(with: password) ||
                    !NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*").evaluate(with: password) || password.count < 12){
                    self.isPasswordValid = true
                } else {
                    self.isPasswordValid = false
            
                }
                if(!isEmailValid && !isPasswordValid){
                    self.showingAlert = true
                }
            }){ Text("EINLOGGEN")
                               .font(.headline)
                               .foregroundColor(.white)
                               .padding()
                               .frame(width: 265, height: 50)
                               .background(Color.black)
                               .cornerRadius(15.0)
                               .shadow(radius: 10.0, x: 20, y: 10)
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("Du bist eingeloggt"), message: Text("Du hast gültige Daten eingegeben"), primaryButton: .destructive(Text("OK")), secondaryButton: .cancel())}.padding(.top, 20)
           
          
        }
       
        Spacer()
            HStack(alignment: .bottom, spacing: 10) {
                 Button(action: {}) {
                     Text("DARK THEME")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 25)
                        .background(Color.black)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0, x: 30, y: 20)
                 }.padding(.bottom, 24.0)
                Button(action: {}) {
                    Text("LIGHT THEME")
                       .font(.callout)
                       .foregroundColor(.white)
                       .padding()
                       .frame(width: 150, height: 25)
                       .background(Color.black)
                       .cornerRadius(15.0)
                       .shadow(radius: 10.0, x: 30, y: 20)
                }.padding(.bottom, 24.0)
             }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
