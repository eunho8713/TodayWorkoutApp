//
//  NewResponse.swift
//  TodayWorkout
//
//  Created by 이은호 on 2022/12/23.
//

import Foundation

enum TagType {
    case rnum
    case creator
    case publisher
    case collectionDb
    case regDate
    case issuedDate
    case period
    case title
    case medium
    case extent
    case venue
    case description
    case affiliation
    case subDescription
    case spatial
    case relation
    case reference
    case rights
    case source
    case contributor
    case subjectCategory
    case grade
    case subjectKeyword
    case state
    case url
    case none
}

struct item {
    var rnum: String
    var creator: String
    var publisher: String
    var collectionDb: String
    var regDate: String
    var issuedDate: String
    var period: String
    var title: String
    var medium: String
    var extent: String
    var venue: String
    var description: String
    var affiliation: String
    var subDescription: String
    var spatial: String
    var relation: String
    var reference: String
    var rights: String
    var source: String
    var contributor: String
    var subjectCategory: String
    var grade: String
    var subjectKeyword: String
    var state: String
    var url: String
    
    init() {
        rnum = ""
        creator = ""
        publisher = ""
        collectionDb = ""
        regDate = ""
        issuedDate = ""
        period = ""
        title = ""
        medium = ""
        extent = ""
        venue = ""
        description = ""
        affiliation = ""
        subDescription = ""
        spatial = ""
        relation = ""
        reference = ""
        rights = ""
        source = ""
        contributor = ""
        subjectCategory = ""
        grade = ""
        subjectKeyword = ""
        state = ""
        url = ""
    }

}
