//
//  EventFormType.swift
//  Quanta
//
//  Created by SaiLalith Kanumuri on 12/17/22.
//

import SwiftUI

// Form type to check whether it is new or updated
enum EventFormType: Identifiable, View {
    case new
    case update(Event)
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }

    var body: some View {
        switch self {
        case .new:
            return EventFormView(viewModel: EventFormViewModel())
        case .update(let event):
            return EventFormView(viewModel: EventFormViewModel(event))
        }
    }
}
