//
//  Constant.swift
//  RaptureReady
//
//  Created by anca dev on 18/06/24.
//

import Foundation

enum homeTab: CaseIterable {
    case raptureReady, raptureIndex, rrNews, Videos, readBible
    case nearingMidnight, israelWatch, prayerCenter, rrForums, vertizontalMedia
    case endTime, christian
    
    var Icon: String {
        switch self {
        case .raptureReady:
            return "person.3"
        case .raptureIndex:
            return "chart.line.uptrend.xyaxis"
        case .rrNews:
            return "newspaper"
        case .Videos:
            return "video"
        case .readBible:
            return "book"
        case .nearingMidnight:
            return "12.circle"
        case .israelWatch:
            return "clock"
        case .prayerCenter:
            return "doc.richtext"
        case .rrForums:
            return "shared.with.you"
        case .vertizontalMedia:
            return "chevron.down"
        case .endTime:
            return "pencil"
        case .christian:
            return "pencil.and.outline"
        }
    }
    
    var Title: String {
        switch self {
        case .raptureReady:
            return "Rapture Ready"
        case .raptureIndex:
            return "Rapture Index"
        case .rrNews:
            return "RR News"
        case .Videos:
            return "Rapture Ready TV"
        case .readBible:
            return "Read Bible"
        case .nearingMidnight:
            return "Nearing Midnight"
        case .israelWatch:
            return "Israel Watch"
        case .prayerCenter:
            return "Prayer Center"
        case .rrForums:
            return "RR Forums"
        case .vertizontalMedia:
            return "Vertizontal Media"
        case .endTime:
            return "End Time Writers"
        case .christian:
            return "Christian Classics"
        }
    }
}

enum otherHomeTab: CaseIterable {
    case contact, donate, facebook
    
    var Icon: String {
        switch self {
        case .contact:
            return "message"
        case .donate:
            return "dollarsign"
        case .facebook:
            return "f.circle"    
        }
    }
    
    var Title: String {
        switch self {
        case .contact:
            return "Contact"
        case .donate:
            return "Donate"
        case .facebook:
            return "Facebook"
        }
    }
}

enum Media: CaseIterable {
    case watchTV, podcasts, radio, onDemand
    case tvChannels, musicVideos
    
    var Icon: String {
        switch self {
        case .watchTV:
            return "tv"
        case .podcasts:
            return "mic"
        case .radio:
            return "dot.radiowaves.left.and.right"
        case .onDemand:
            return "play"
        case .tvChannels:
            return "tv.circle"
        case .musicVideos:
            return "music.note"
        }
    }
    
    var Title: String {
        switch self {
        case .watchTV:
            return "Watch TV"
        case .podcasts:
            return "Podcasts"
        case .radio:
            return "Radio"
        case .onDemand:
            return "On Demand"
        case .tvChannels:
            return "TV Channels"
        case .musicVideos:
            return "Music Videos"
        }
    }
}
