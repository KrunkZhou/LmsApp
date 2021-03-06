//
//  SakaiEndpoint.swift
//  SakaiClientiOS
//
//  Created by Pranay Neelagiri on 8/31/18.
//  Modified by Krunk
//

import Foundation

/// Details the group of different Sakai endpoints used by the app and
/// provides easy URL construction
enum SakaiEndpoint {
    static let baseUrl = "https://lms.brocku.ca/direct/"

    static func getUrl(endpoint: String) -> String {
        return baseUrl + endpoint
    }

    case sites, session, user, gradebook, assignments, newChat
    case announcements(Int, Int), siteAnnouncements(String, Int, Int)
    case siteGradebook(String), siteAssignments(String), siteResources(String)

    // swiftlint:disable cyclomatic_complexity
    func getEndpoint() -> String {
        switch self {
        case .sites:
            return SakaiEndpoint.getUrl(endpoint: "site.json")
        case .session:
            return SakaiEndpoint.getUrl(endpoint: "session/current.json")
        case .user:
            return SakaiEndpoint.getUrl(endpoint: "user/current.json")
        case .gradebook:
            return SakaiEndpoint.getUrl(endpoint: "gradebook/my.json")
        case .assignments:
            return SakaiEndpoint.getUrl(endpoint: "assignment/my.json")
        case .newChat:
            return SakaiEndpoint.getUrl(endpoint: "chat-message/new")
        case .announcements(let limit, let daysBack):
            return SakaiEndpoint
                .getUrl(endpoint: "announcement/user.json?n=\(limit)&d=\(daysBack)")
        case .siteAnnouncements(let siteId, let limit, let daysBack):
            return SakaiEndpoint
                .getUrl(endpoint: "announcement/site/\(siteId).json?n=\(limit)&d=\(daysBack)")
        case .siteGradebook(let siteId):
            return SakaiEndpoint.getUrl(endpoint: "gradebook/site/\(siteId).json")
        case .siteAssignments(let siteId):
            return SakaiEndpoint.getUrl(endpoint: "assignment/site/\(siteId).json")
        case .siteResources(let siteId):
            return SakaiEndpoint.getUrl(endpoint: "content/site/\(siteId).json")
        }
    }
}
