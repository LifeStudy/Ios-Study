//
//  GenericErrorView.swift
//  SwiftBank
//
//  Created by ALURA on 23/03/24.
//

import SwiftUI

struct GenericErrorView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // MARK: - UI Components
    
    private let backgroundColor = Color(red: 240.0/255.0,
                                        green: 240.0/255.0,
                                        blue: 240.0/255.0)
    
    private let yellowColor = Color(red: 255.0/255.0,
                                    green: 186.0/255.0,
                                    blue: 5.0/255.0)
    
    // MARK: - View
    
    public var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: [yellowColor, backgroundColor]), startPoint: .top, endPoint: .bottom)
            
            VStack {
                cardView
                    .padding()
            }
        }
    }
    
    var cardView: some View {
        RoundedRectangle(cornerRadius: 7)
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 7))
            .shadow(color: Color.gray.opacity(0.5), radius: 7, x: 0, y: 2)
            .overlay {
                VStack(alignment: .leading) {
                    errorView
                        .padding(.top, 20)
                        .padding(.horizontal)
                    
                    Spacer()
                }
            }
    }
    
    var errorView: some View {
        VStack(alignment: .center) {
            Image("error-icon")
                .resizable()
                .frame(width: 150, height: 130)

            Text("Ocorreu um erro!")
                .font(.system(size: 19))
                .foregroundColor(.black)
                .fontWeight(.medium)
                .padding(.bottom, 5)
            
            backButton
                .padding(.top, 20)
            
        }
    }
    
    var backButton: some View {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Voltar para a Home")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(25)
            }
        }
}

struct GenericErrorView_Previews: PreviewProvider {
    static var previews: some View {
        GenericErrorView()
    }
}

#Preview {
    GenericErrorView()
}
