import SwiftUI

struct PostView: View {
    @ObservedObject var viewModel: PostViewModel
    
    var body: some View {
        VStack {
            Text("Post View")
            Button("Go to Article") {
                viewModel.navigateToArticle()
            }
        }
    }
}

class PostViewModel: ObservableObject {
    let coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToArticle() {
        coordinator.push(.article)
    }
}

struct ArticleView: View {
    @ObservedObject var viewModel: ArticleViewModel
    
    var body: some View {
        VStack {
            Text("Article View")
            // Add your article content and actions here
        }
    }
}

class ArticleViewModel: ObservableObject {
    let coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}

import SwiftUI

struct InitialView: View {
    @ObservedObject var viewModel: InitialViewModel
    
    var body: some View {
        VStack {
            Text("Welcome to the App")
            Button("Go to Login") {
                viewModel.navigateToLogin()
            }
            Button("Go to Main") {
                viewModel.navigateToMain()
            }
        }
    }
}

class InitialViewModel: ObservableObject {
    let coordinator: LoginCoordinator
    
    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToLogin() {
        coordinator.push(.login("this is the key"))
    }
    
    func navigateToMain() {
        coordinator.showMainCoordinator()
    }
}

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Text("Login")
            Button("Go to Main") {
                viewModel.navigateToMain()
            }
            // Add your login fields and actions here
        }
    }
}

class LoginViewModel: ObservableObject {
    let coordinator: LoginCoordinator
    
    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToMain() {
        coordinator.showMainCoordinator()
    }
}
