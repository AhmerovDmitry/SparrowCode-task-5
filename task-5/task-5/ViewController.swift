//
//  ViewController.swift
//  task-5
//
//  Created by Ахмеров Дмитрий Николаевич on 15.07.2023.
//

import UIKit

final class ViewController: UIViewController {

	private lazy var presentButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Present", for: .normal)
		button.addTarget(self, action: #selector(userDidTapPresentButton), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false

		return button
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		view.addSubview(presentButton)

		NSLayoutConstraint.activate([
			presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			presentButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25)
		])
	}
}

// MARK: - UIPopoverPresentationControllerDelegate

extension ViewController: UIPopoverPresentationControllerDelegate {

	func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
		.none
	}
}

// MARK: - Private

private extension ViewController {

	@objc func userDidTapPresentButton() {
		let viewController = PopoverViewController()
		viewController.modalPresentationStyle = .popover

		let popover = viewController.popoverPresentationController
		popover?.delegate = self
		popover?.sourceView = presentButton
		popover?.sourceRect = presentButton.bounds
		popover?.permittedArrowDirections = .up

		present(viewController, animated: true)
	}
}
