//
//  Model.swift
//  TodayWorkout
//
//  Created by 이은호 on 2022/12/08.
//

import Foundation

struct Response: Codable {
    struct Header: Codable {
        let resultCode: Int
        let resultMsg: String
    }
    
    struct Body: Codable {
        struct Items: Codable {
            let item: [Item]
        }
        
        struct Item: Codable, Equatable {
            let rnum: Int
            let creator: String
            let publisher: String
            let collectionDb: String
            let regDate: String?
            let issuedDate: String?
            let period: String?
            let title: String
            let medium: String?
            let extent: String?
            let venue: String
            let description: String?
            let affiliation: String?
            let subDescription: String
            let spatial: String
            let relation: String
            let reference: String?
            let rights: String?
            let source: String?
            let contributor: String?
            let subjectCategory: String
            let grade: String?
            let subjectKeyword: String?
            let state: String?
            let url: String?
        }
        
        let items: Items
        let numOfRows: Int
        let pageNo: Int
        let totalCount: Int
    }
    
    let header: Header
    let body: Body
}
