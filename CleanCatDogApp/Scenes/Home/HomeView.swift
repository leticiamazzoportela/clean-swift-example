//
//  HomeView.swift
//  CleanCatDogApp
//
//  Created by Leticia Mazzo Portela on 10/01/23.
//

import SwiftUI

protocol HomeViewDisplayProtocol {
    func updateImage(viewModel: HomeViewModel)
}

protocol HomeViewRequestProtocol {
    func fetchRandomCatFromInteractor()
    func fetchRandomDogFromInteractor()
}

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    private let defaultSize = UIScreen.main.bounds.width * 0.7

    var interactor: HomeInteractorProtocol?

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                ZStack {
                    AsyncImage(url: self.viewModel.imageURL) { image in
                        self.makeImage(image: image)
                    } placeholder: {
                        self.makeImage(image: Image("placeholder"))
                    }

                }.padding(12)

                self.makeButtonsStack()
            }
        }
    }
}

extension HomeView: HomeViewRequestProtocol {
    func fetchRandomCatFromInteractor() {
        self.viewModel.handleLoading(status: true)
        self.interactor?.fetchRandomCat()
    }

    func fetchRandomDogFromInteractor() {
        self.viewModel.handleLoading(status: true)
        self.interactor?.fetchRandomDog()
    }
}

extension HomeView: HomeViewDisplayProtocol {
    func updateImage(viewModel: HomeViewModel) {
        self.viewModel.handleLoading(status: false)
        self.viewModel.imageURL = viewModel.imageURL
    }
}

private extension HomeView {
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
        .background(self.viewModel.isLoading ? color.opacity(0.7) : color)
        .cornerRadius(8)
        .frame(width: defaultSize)
        .disabled(self.viewModel.isLoading)
    }

    func makeImage(image: Image) -> some View {
        image
            .resizable()
            .frame(width: defaultSize, height: defaultSize)
            .clipShape(RoundedRectangle(cornerRadius: 24.0))
    }

    func makeButtonsStack() -> some View {
        VStack {
            ZStack {
                makeButton(with: "Ver Gato", and: Color.indigo.opacity(0.8)) {
                    self.fetchRandomCatFromInteractor()
                }
            }.padding(4)

            makeButton(with: "Ver Cachorro", and: Color.indigo.opacity(0.5)) {
                self.fetchRandomDogFromInteractor()
            }
        }
    }
}
