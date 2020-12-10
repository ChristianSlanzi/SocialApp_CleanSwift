//
//  TodoListingModel.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 04.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

struct TodoListingModel {	
	struct Request {
		// do someting...

		var parameters: [String: Any]? {
			// do someting...
			return nil
		}
	}

    struct Response {
        var todos: [Todo]
    }

    struct ViewModel {
        struct DisplayedTodo {
            var id: Int
            var name: String
            var completed: Bool
        }
        var displayedTodos: [DisplayedTodo]
    }
}
