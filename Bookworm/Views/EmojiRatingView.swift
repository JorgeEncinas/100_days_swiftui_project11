//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Jorge Encinas on 7/22/25.
//
import SwiftUI

struct EmojiRatingView : View {
    let rating : Int
    
    var body : some View {
        switch rating {
        case 1:
            Text("😐")
        case 2:
            Text("😪")
        case 3:
            Text("👍")
        case 4:
            Text("😁")
        default: //case 5:
            Text("🔥")
        }
    }
}

#Preview {
    EmojiRatingView(rating: 4)
}
