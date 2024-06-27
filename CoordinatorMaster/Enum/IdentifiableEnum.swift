//
//  IdentifiableEnum.swift
//  CoordinatorMaster
//
//  Created by Developer on 26.06.24.
//

protocol IdentifiableEnum: Hashable, Identifiable {
    var id: String { get }
}

extension IdentifiableEnum {
    var id: String {
        String(describing: self)
    }
}

enum EmptyEnum: IdentifiableEnum {}

