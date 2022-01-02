//
//  SocialWorker.swift
//  Social worker P.5
//
//  Created by بندر عبيد ثاري الرشيدي on 29/05/1443 AH.
//
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

struct Social : Codable {
    var NameSocial : String = ""
    var EmailSocial : String = ""
    var TypeSocial : String = ""
    var id : String = ""
    var image : String = ""
}
