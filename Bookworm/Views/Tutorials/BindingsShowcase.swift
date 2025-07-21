//
//  BindingsShowcase.swift
//  Bookworm
//
//  Created by Jorge Encinas on 7/21/25.
//
import SwiftUI

struct BindingsView1 : View {
    @State private var rememberMe = false
    
    var body : some View {
        VStack {
            Toggle("Remember Me", isOn: $rememberMe)
        }
    }
}

// BINDABLE vs BINDING
//  `Bindable` is used for a Shared class with the `@Observable` macro
//      You create is using @State in one view
//      But use @Bindable when sharing it with other views, so SwiftUI can create bindings there too.

//  `Binding` is used for a simple value type piece of data, rather than for a separate class
//      You have, e.g. a @State boolean,
//                     a Double
//                     an array of strings
//      and you want to pass that around, and since it can't use the `@Observable` macro
//      we can't use `@Bindable`, so instead there's `@Binding`

// Exposing a `@Binding` property to interface with other views.
//  Let's create a button that stays down when pressed.

struct PushButton : View {
    let title : String
    @State var isOn : Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body : some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(
                colors: isOn ? onColors : offColors,
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct BindingsView2 : View {
    @State private var rememberMe = false
    
    var body : some View {
        VStack {
            PushButton(
                title: "Remember Me",
                isOn: rememberMe
            )
            //Since it's not a two-way binding, whatever it receives
            // is being used as a state variable, and changed, but is NOT shared back to this
            // parent View!
            Text(rememberMe ? "On" : "Off")
        }
    }
}

struct PushButton2 : View {
    let title : String
    @Binding var isOn : Bool //We changed this one into a `Binding`
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body : some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(
                colors: isOn ? onColors : offColors,
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct BindingsView3 : View {
    @State private var rememberMe = false
    var body : some View {
        VStack {
            PushButton2(
                title: "Remember Me 2",
                isOn: $rememberMe
            )
            Text(rememberMe ? "On" : "Off")
        }
    }
}

#Preview {
    VStack {
        BindingsView2()
        BindingsView3()
    }
}
