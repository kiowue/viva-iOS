//
//  ViewPresenter.swift
//  Viva1
//
//  Created by vishwender on 8/25/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation

class ViewPresenter: ViewPresenterProtocol {
    weak var view: ViewControllerProtocol?
    var interactor: ViewInteractorInputProtocol?
    var wireFrame: ViewInterfaceProtocol?
    
    var tempContentOrderedSet: NSOrderedSet = NSOrderedSet()
    
    init(view: ViewControllerProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor?.getUIContent()
    }
    
    func showPostDetail<T>(forPost post: T) {
        //
    }
}
