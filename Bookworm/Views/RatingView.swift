//
//  RatingView.swift
//  Bookworm
//
//  Created by Jorge Encinas on 7/22/25.
//
import SwiftUI

struct RatingView : View {
    @Binding var rating : Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage : Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
    
    var body : some View {
        HStack {
            if !label.isEmpty {
                Text(label)
            }
            
            ForEach(1..<maximumRating+1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
                .buttonStyle(.plain) //SwiftUI treats each button individually
                // so that it doesn't consider each one as a row. (since in an HStack, all rows are on top of each other)
            }
        }
    }
}

#Preview {
    // `Constant Bindings` let us overcome having to create a State variable.
    //RatingView(rating: .constant(4))
    @Previewable @State var rating : Int = 4
    RatingView(rating: $rating)
}
