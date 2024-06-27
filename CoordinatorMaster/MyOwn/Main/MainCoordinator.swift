////
////  MainCoordinator.swift
////  CoordinatorMaster
////
////  Created by Developer on 26.06.24.
////
//
//import SwiftUI
//
//final class MainCoordinator: CoreCoordinator<MainCoordinator.Page, EmptyEnum, EmptyEnum> {
//    enum Page: IdentifiableEnum {
//        case post
//        case article
//    }
//}
//
//struct MainCoordinatorView: View {
//    @ObservedObject var coordinator: MainCoordinator
//    
//    init(coordinator: MainCoordinator) {
//        self.coordinator = coordinator
//    }
//    
//    var body: some View {
//        NavigationStack(path: $coordinator.path) {
//            PostView(viewModel: PostViewModel(coordinator: coordinator))
//                .navigationDestination(for: MainCoordinator.Page.self) { page in
//                    switch page {
//                    case .post:
//                        PostView(viewModel: PostViewModel(coordinator: coordinator))
//                    case .article:
//                        ArticleView(viewModel: ArticleViewModel(coordinator: coordinator))
//                    }
//                }
//        }
//    }
//}
