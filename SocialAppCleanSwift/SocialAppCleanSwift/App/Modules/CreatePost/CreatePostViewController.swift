//
//  CreatePostViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 15.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ICreatePostViewController: class {
	// do someting...
}

class CreatePostViewController: UIViewController {
	var interactor: ICreatePostInteractor!
	var router: ICreatePostRouter!
    
    private let headerView: UserHeaderView = {
        let view = UserHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    private let textView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.text = "What are you doing now?"
        view.textColor = UIColor.lightGray
        return view
    }()

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        
        setupViews()
        setupConstraints()
    }
}

extension CreatePostViewController: ICreatePostViewController {
	// do someting...
}

extension CreatePostViewController {
	// do someting...
    func setupViews() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(sendPost))
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        view.addSubview(headerView)
        view.addSubview(textView)
        textView.delegate = self
    }
    
    func setupConstraints() {
        let margin: CGFloat = 16.0
        
        NSLayoutConstraint.activate([
            headerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 92),
            headerView.heightAnchor.constraint(equalToConstant: 75),
            headerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0)
        ])
        
        NSLayoutConstraint.activate([
            textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            textView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: margin),
            textView.heightAnchor.constraint(equalToConstant: 150),
            textView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0)
        ])
    }
    
    @objc func sendPost() {
        //router.navigateToCreatePost()
    }
}

extension CreatePostViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        // Combine the textView text and the replacement text to
        // create the updated text string
        let currentText:String = textView.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)

        // If updated text view will be empty, add the placeholder
        // and set the cursor to the beginning of the text view
        if updatedText.isEmpty {

            textView.text = "What are you doing now?"
            textView.textColor = UIColor.lightGray

            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
        }

        // Else if the text view's placeholder is showing and the
        // length of the replacement string is greater than 0, set
        // the text color to black then set its text to the
        // replacement string
         else if textView.textColor == UIColor.lightGray && !text.isEmpty {
            textView.textColor = UIColor.black
            textView.text = text
        }

        // For every other case, the text should change with the usual
        // behavior...
        else {
            return true
        }

        // ...otherwise return false since the updates have already
        // been made
        return false
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if self.view.window != nil {
            if textView.textColor == UIColor.lightGray {
                textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
            }
        }
    }
}
