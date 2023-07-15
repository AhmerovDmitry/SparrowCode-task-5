//
//  PopoverViewController.swift
//  task-5
//
//  Created by Ахмеров Дмитрий Николаевич on 15.07.2023.
//

import UIKit

final class PopoverViewController: UIViewController {

	private lazy var closeButton: UIButton = {
		let button = UIButton(type: .close)
		button.setImage(UIImage(systemName: "xmark"), for: .normal)
		button.addTarget(self, action: #selector(userDidTapCloseButton), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false

		return button
	}()

	private lazy var segmentedControl: UISegmentedControl = {
		let segmentedControl = UISegmentedControl()
		segmentedControl.insertSegment(withTitle: "280pt", at: 0, animated: true)
		segmentedControl.insertSegment(withTitle: "150pt", at: 1, animated: true)
		segmentedControl.selectedSegmentIndex = 0
		segmentedControl.addTarget(self, action: #selector(userDidTapChangePickerSize), for: .valueChanged)
		segmentedControl.translatesAutoresizingMaskIntoConstraints = false

		return segmentedControl
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		preferredContentSize = CGSize(width: 300, height: 280)
		view.addSubview(segmentedControl)
		view.addSubview(closeButton)
		NSLayoutConstraint.activate([
			segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),

			closeButton.centerYAnchor.constraint(equalTo: segmentedControl.centerYAnchor),
			closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5)
		])
	}
}

// MARK: - Private

private extension PopoverViewController {

	@objc func userDidTapCloseButton() {
		dismiss(animated: true)
	}

	@objc func userDidTapChangePickerSize(_ sender: UISegmentedControl) {
		preferredContentSize.height = sender.selectedSegmentIndex == 0 ? 280 : 150
	}
}
