//
//  ContentView.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 10/01/23.
//

import SwiftUI

struct HomeSceneView: View {
    private let defaultSize = UIScreen.main.bounds.width * 0.7
    private var interactor: HomeSceneInteractorProtocol?

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                ZStack {
                    Image("placeholder")
                        .resizable()
                        .frame(width: defaultSize, height: defaultSize)
                        .clipShape(RoundedRectangle(cornerRadius: 24.0))
                }.padding(12)

                ZStack {
                    makeButton(with: "Ver Gato", and: Color.indigo.opacity(0.8)) {
                        self.fetchRandomCat()
                    }
                }.padding(4)

                makeButton(with: "Ver Cachorro", and: Color.indigo.opacity(0.5)) {
                    self.fetchRandomDog()
                }
            }

        }
    }
}

private extension HomeSceneView {
    func makeButton(with title: String, and color: Color, action: @escaping () -> Void) -> some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .fontWeight(.bold)
        }
        .padding()
        .background(color)
        .cornerRadius(8)
        .frame(width: defaultSize)
    }
}

private extension HomeSceneView {
    func fetchRandomCat() {
        self.interactor?.fetchRandomCat()
    }

    func fetchRandomDog() {
        self.interactor?.fetchRandomDog()
    }
}
