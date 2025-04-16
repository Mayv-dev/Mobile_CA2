//
//  Notifications.swift
//  mobile_CA2
//
//  Created by Student on 11/04/2025.
//

import Foundation
import UserNotifications


func notificationPermission() async {
    let center = UNUserNotificationCenter.current()
    
    do {
        try await center.requestAuthorization(options: [.alert, .badge, .sound])
    } catch {
        
    }
}

func scheduleNotification(title: String, body: String) async {
    let center = UNUserNotificationCenter.current()
    
    let settings = await center.notificationSettings()
    
    guard (settings.authorizationStatus == .authorized) else {
        return
    }
    
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    
    var dateComponents = DateComponents()
    dateComponents.calendar = Calendar.current
    dateComponents.minute = dateComponents.minute! + 1
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
    
    await registerNotificationRequest(content: content, trigger: trigger)
}

func registerNotificationRequest(content: UNMutableNotificationContent, trigger: UNNotificationTrigger?) async {
    let uuid = UUID().uuidString
    let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
    
    let center = UNUserNotificationCenter.current()
    do {
        try await center.add(request)
    } catch {
        
    }
}

func deleteNotificationRequest(notifcationId: String) async {
    let center = UNUserNotificationCenter.current()
    center.removePendingNotificationRequests(withIdentifiers: [notifcationId])
}
