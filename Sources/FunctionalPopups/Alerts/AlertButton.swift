//
//  SwiftUIView.swift
//  
//
//  Created by Jenya Lebid on 2/20/23.
//

import SwiftUI

public struct AlertButton<Content: View>: View {
    
    var image: String?
    var text: String?
    var height: CGFloat?
    var width: CGFloat?
    var foreground: Color
    var background: Color
    var font: Font
    
    var action: (() -> ())?
    var content: () -> Content
    
    @State private var destinationActive = false

    
    public init(image: String? = nil, text: String? = nil, width: CGFloat? = nil, height: CGFloat? = nil, foreground: Color = .white, background: Color = .accentColor, font: Font = .body, action: (() -> ())? = nil, @ViewBuilder content: @escaping () -> Content = {EmptyView()}) {
        self.image = image
        self.text = text
        self.width = width
        self.height = height
        self.foreground = foreground
        self.background = background
        self.font = font
        self.action = action
        self.content = content
    }
    
    public var body: some View {
        Button {
            if let action {
                action()
            }
            if hasDestination {
                destinationActive.toggle()
            }
        } label: {
            HStack {
                if let image = image {
                    Image(systemName: image)
                }
                if let text = text {
                    Text(text)
                }
            }
            .font(font)
            .foregroundColor(foreground)
            .padding(10)
            .frame(width: width, height: height)
            .background(
                Group {
                    background
                    if hasDestination {
                        NavigationLink(destination: content(), isActive: $destinationActive) {
                            EmptyView()
                        }
                    }
                }
            )
            .cornerRadius(10)
        }
    }
    
    var hasDestination: Bool {
        return !(content is (() -> EmptyView))
    }
}

struct TextButtonBlock_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            AlertButton(text: "Hello", background: .red, content:  {
                
            })
            AlertButton(image: "person", height: 41, content:  {
                
            })
        }
    }
}
