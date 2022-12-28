//
//  ActivityView.swift
//  SwiftUIIntro
//
//  Created by Armstrong on 28/12/22.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: Context) -> some UIViewController {
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)

        return activityController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }

}
