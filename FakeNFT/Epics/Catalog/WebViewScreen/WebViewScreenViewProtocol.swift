//
//  WebViewScreenViewProtocol.swift
//  FakeNFT
//
//  Created by Богдан Полыгалов on 13.08.2023.
//

import WebKit

protocol WebViewScreenViewControllerProtocol: AnyObject {
    var presenter: WebViewScreenViewPresenterProtocol? { get set }
    func updateProgressView(estimatedProgress: Float)
    func removeProgressView()
}

protocol WebViewScreenViewPresenterProtocol {
    var viewController: WebViewScreenViewControllerProtocol? { get set }
    var authorWebSiteLink: String { get set }
    func didUpdateProgressValue(estimatedProgress: Float)
}
