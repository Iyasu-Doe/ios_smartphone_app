//
//  data.swift
//  TaskList
//
//  Created by user218544 on 3/22/22.
//

import Foundation
import SwiftUI
import Combine

struct task: Identifiable{
var id: ObjectIdentifier
    var name: String
}


class taskStore : ObservableObject{
    @Published var tasks = [task]()
}
