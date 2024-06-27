import SwiftUI

protocol CoreCoordinatorProtocol {
    associatedtype PushNavigationEnum: Hashable
    associatedtype PresentNavigationEnum: Hashable
    associatedtype FullCoverEnum: Hashable
}

class CoreCoordinator<PushNavigationEnum: IdentifiableEnum,
                      PresentNavigationEnum: IdentifiableEnum,
                      FullCoverEnum: IdentifiableEnum>: ObservableObject, CoreCoordinatorProtocol {
    
    @Published var path = NavigationPath()
    @Published var presentSheetItem: PresentNavigationEnum?
    @Published var fullCoverItem: FullCoverEnum?
    private var onDismiss: (() -> Void)?
    
    init(onDismiss: (() -> Void)? = nil) {
        self.onDismiss = onDismiss
    }
    
    func gotoRoot() {
        path.removeLast(path.count)
    }
    
    func push(_ object: PushNavigationEnum) {
        path.append(object)
    }
    
    func present(_ object: PresentNavigationEnum) {
        presentSheetItem = object
    }
    
    func fullCoverPresent(_ object: FullCoverEnum) {
        fullCoverItem = object
    }
}

final class LoginCoordinator: CoreCoordinator<LoginCoordinator.Page, EmptyEnum, LoginCoordinator.Coordinator> {
    enum Page: IdentifiableEnum {
        case initial
        case login(_ someKey: String)
        case newCoordinator
    }
    
    @Published var isMainCoordinatorActive: Bool = false
    
    enum Coordinator: IdentifiableEnum {
        case mainCoordinator
    }
    
    func showMainCoordinator() {
        //        push(.newCoordinator)
        //        presentSheetItem = .mainCoordinator
        isMainCoordinatorActive = true

        fullCoverPresent(.mainCoordinator)
    }
}

struct LoginCoordinatorView: View {
    @ObservedObject var coordinator = LoginCoordinator()
    
    init(coordinator: LoginCoordinator = LoginCoordinator()) {
        self.coordinator = coordinator
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            InitialView(viewModel: InitialViewModel(coordinator: coordinator))
                .navigationDestination(for: LoginCoordinator.Page.self) { page in
                    switch page {
                    case .initial:
                        InitialView(viewModel: InitialViewModel(coordinator: coordinator))
                    case .login(let key):
                        LoginView(viewModel: LoginViewModel(coordinator: coordinator))
                    case .newCoordinator:
                        MainCoordinatorView(coordinator: MainCoordinator())
                    }
                }
                .fullScreenCover(item: $coordinator.fullCoverItem) { item in
                    switch item {
                    case .mainCoordinator:
                        MainCoordinatorView(coordinator: MainCoordinator())
                    }
                }
            
        }
    }
}

final class MainCoordinator: CoreCoordinator<MainCoordinator.Page, EmptyEnum, EmptyEnum> {
    enum Page: IdentifiableEnum {
        case post
        case article
    }
}

struct MainCoordinatorView: View {
    @ObservedObject var coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            PostView(viewModel: PostViewModel(coordinator: coordinator))
                .navigationDestination(for: MainCoordinator.Page.self) { page in
                    switch page {
                    case .post:
                        PostView(viewModel: PostViewModel(coordinator: coordinator))
                    case .article:
                        ArticleView(viewModel: ArticleViewModel(coordinator: coordinator))
                    }
                }
        }
    }
}
