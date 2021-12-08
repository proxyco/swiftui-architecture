//
//  EmbeddingUIKitView.swift
//  TwinPrototyping
//
//  Created by Raluca Toadere on 18.11.2021.
//

import SwiftUI
import Combine

final class EmbeddingUIKitViewModel: ObservableObject {
    @Published var title: String
    @Published var fallbackUIModel: FallbackView.UIModel

    @Published var buttonTapCount: Int = 0

    var timerSubscription: AnyCancellable?

    private var timerFiredCount = 0 {
        didSet {
            updateTimerFiredCountBasedValues()
        }
    }

    init() {
        title = Self.buildTitle(timerFiredCount: timerFiredCount)
        fallbackUIModel = Self.buildFallbackUIModel(timerFiredCount: timerFiredCount)
        setupBindings()
    }

    func setupBindings() {
        timerSubscription = Timer.publish(every: 4, on: .main, in: .default)
            .autoconnect()
            .sink(receiveValue: { [weak self] date in
                guard let self = self else { return }
                self.timerFiredCount += 1
            })
    }

    private func updateTimerFiredCountBasedValues() {
        self.title = Self.buildTitle(timerFiredCount: timerFiredCount)
        self.fallbackUIModel = Self.buildFallbackUIModel(timerFiredCount: timerFiredCount)
    }

    private static func buildTitle(timerFiredCount: Int) -> String {
        "(SwiftUI) Timer fired \(timerFiredCount) times"
    }

    private static func buildFallbackUIModel(timerFiredCount: Int) -> FallbackView.UIModel {
        FallbackView.UIModel(
            title: "(UIKit) Timer fired \(timerFiredCount) times",
            actionTitle: "(UIKit) Button")
    }
}

struct EmbeddingUIKitView: View {
    @ObservedObject var viewModel: EmbeddingUIKitViewModel
    
    var body: some View {
        VStack{
            Text(viewModel.title)
                .padding()
            Text("(SwiftUI) Button tap count: \(viewModel.buttonTapCount)")
                .padding()
            FallbackViewControllerWrapper(
                model: $viewModel.fallbackUIModel,
                buttonTapCount: $viewModel.buttonTapCount
            )
        }
    }
}

struct EmbeddingUIKitView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmbeddingUIKitView(viewModel: EmbeddingUIKitViewModel())
        }
    }
}
