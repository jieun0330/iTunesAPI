//
//  iTunesAPI.swift
//  iTunesAPI
//
//  Created by 박지은 on 4/7/24.
//

import Foundation

struct MainItunes: Decodable {
    let apiResults: [InfoItunes]
}

struct InfoItunes: Decodable {
    let artworkUrl100: String // 로고
    let artistName: String // 회사 이름
    let trackName: String // 앱 이름
}