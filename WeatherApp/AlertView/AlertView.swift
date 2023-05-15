//
//  AlertView.swift
//  WeatherApp
//
//  Created by Le Chris on 12.05.2023.
//

import SwiftUI

struct AlertView: View {
    
    let attention = AppLocalization.Alert.attention
    let question = AppLocalization.Alert.question
    let cancel = AppLocalization.Alert.cancel
    let delete = AppLocalization.Alert.delete
    
    let router: Router
    let onDeleteTap: () -> Void
    
    var body: some View {
        ZStack {
            Group {
                VisualEffectView(effect: UIBlurEffect(style: .dark))
            }
            .ignoresSafeArea()
            .onTapGesture {
                router.dismiss()
            }
            
            VStack {
                Text(attention)
                    .font(.system(size: 20))
                    .padding(.top, 22)
                    .fontWeight(.semibold)
                
                Text(question)
                    .font(.system(size: 15))
                    .foregroundColor(AppAssets.darkGray.swiftUIColor)
                    .multilineTextAlignment(.center)
                    .padding(.top, 16)
                    .padding(.horizontal, 40)
                
                HStack(spacing: 0) {
                    
                    Button(action: {
                        router.dismiss()
                    }, label: {
                        SubButton(title: cancel, color: AppAssets.mediumGray.swiftUIColor)
                    })
                    .padding(.trailing, 12)
                    
                    Button(action: {
                        onDeleteTap()
                        router.dismiss()
                    }, label: {
                        SubButton(title: delete, color: AppAssets.red.swiftUIColor)
                    })
                }
                .padding(.top, 28)
                .padding(.horizontal, 30)
                .padding(.bottom, 19)
            }
            .roundedBackground()
        }
    }
}

struct SubButton: View {
                    
    let title: String
    let color: Color
    
    init(title: String, color: Color) {
        self.title = title
        self.color = color
    }
    
    var body: some View {
        Text(title)
            .foregroundColor(.primary)
            .font(.system(size: 12))
            .padding(.vertical, 11)
            .padding(.horizontal, 41)
            .roundedBackground(7, bgColor: color)
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {            
            AlertView(router: Router(), onDeleteTap: { })
        }
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
