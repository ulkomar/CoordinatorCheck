////
////  LoginCoordinator.swift
////  CoordinatorMaster
////
////  Created by Developer on 26.06.24.
////
//
//import SwiftUI
//
//final class LoginCoordinator: CoreCoordinator<LoginCoordinator.Page, EmptyEnum, LoginCoordinator.Coordinator> {
//    enum Page: IdentifiableEnum {
//        case initial
//        case login(_ someKey: String)
//        case newCoordinator
//    }
//    
//    enum Coordinator: IdentifiableEnum {
//        case mainCoordinator
//    }
//    
//    func showMainCoordinator() {
//        //        push(.newCoordinator)
//        //        presentSheetItem = .mainCoordinator
//        fullCoverPresent(.mainCoordinator)
//    }
//}
//
//struct LoginCoordinatorView: View {
//    @ObservedObject var coordinator = LoginCoordinator()
//    
//    init(coordinator: LoginCoordinator = LoginCoordinator()) {
//        self.coordinator = coordinator
//    }
//    
//    var body: some View {
//        NavigationStack(path: $coordinator.path) {
//            InitialView(viewModel: InitialViewModel(coordinator: coordinator))
//                .navigationDestination(for: LoginCoordinator.Page.self) { page in
//                    switch page {
//                    case .initial:
//                        InitialView(viewModel: InitialViewModel(coordinator: coordinator))
//                    case .login(let key):
//                        LoginView(viewModel: LoginViewModel(coordinator: coordinator))
//                    case .newCoordinator:
//                        MainCoordinatorView(coordinator: MainCoordinator())
//                    }
//                }
//                .fullScreenCover(item: $coordinator.fullCoverItem) { item in
//                    switch item {
//                    case .mainCoordinator:
//                        MainCoordinatorView(coordinator: MainCoordinator())
//                    }
//                }
//        }
//    }
//}
