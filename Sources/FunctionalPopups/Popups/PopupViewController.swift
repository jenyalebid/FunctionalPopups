//
//  PopupViewController.swift
//  FunctionalPopups
//
//  Created by Jenya Lebid on 3/11/23.
//

import UIKit
import SwiftUI

class PopupViewController<PopupContent: View>: UIViewController {
    
    var popupContent: PopupContent
    
    init(popupContent: PopupContent) {
        self.popupContent = popupContent
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let popup = UIHostingController(rootView: popupContent)
        popup.modalPresentationStyle = .overFullScreen
        popup.view.backgroundColor = .clear
        self.present(popup, animated: false, completion: nil)
    }
}
