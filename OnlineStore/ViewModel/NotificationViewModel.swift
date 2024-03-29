//
//  NotificationViewModel.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.08.23.
//

import SwiftUI
import CloudKit

class NotificationViewModel: ObservableObject{
    let controller = PersistenceController.shared.database
    
    func requestPermissions() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print(error)
            } else if success {
                print("Permissions success!")
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                print("Permissions failure!")
            }
        }
    }
    
    func subscribeNotifications() {
        let predicate = NSPredicate(value: true)
        let subscription = CKQuerySubscription(
            recordType: "CD_ShippedOrder",
            predicate: predicate,
            subscriptionID: "order_shipped",
            options: .firesOnRecordCreation
        )
        
        let notification = CKSubscription.NotificationInfo()
        notification.title = "Order shipped!"
        notification.alertBody = "Your Order was shipped and will arrive soon."
        notification.soundName = "default"
        
        subscription.notificationInfo = notification
        
        controller.save(subscription) { returnedSubscription, error in
            if let error = error {
                print(error)
            } else {
                print("Subscription success!")
            }
        }
    }
    
    func unsubscribeNotification() {
        controller.delete(withSubscriptionID: "order_shipped") { id, error in
            if let error = error {
                print(error)
            } else {
                print("Unsubscribe success!")
            }
        }
    }
}


