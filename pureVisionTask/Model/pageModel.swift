//
//  pageModel.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/16/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import Foundation
struct pageModel {
    let imageName: String
    let titel    : String
    let textData : String
}
struct religionData:Codable {
    let data: [relData]
}

struct relData:Codable {
    let religion_id, religion_name, arabic_name: String
}

struct langGradeArr:Codable{
    let data : [langGrade]
}

struct langGrade:Codable {
    let level_lang_id, level_lang_name: String
}
struct langPost:Encodable{
    let language_id:String
    let level_lang_id:String
    let user_id : String
}

struct regData :Encodable {
    let username: String
    let email:String
    let password:String
}

struct personData :Encodable {
    let fullname: String
    let birthday:String
    let address:String
    let email:String
    let civil_id_no:String
    let telephone: String
    let mobile: String
    let gender:String
    let martial_status:String
    let nationality_id: String
    let country_id:String
    let city_name:String
    let religion_id:String
    let user_id:String
    let image_name:String
    }
struct educationInsertData :Encodable {
    let college_name: String
    let graduationyear:String
    let university_name:String
    let fields_study:String
    let endyear:String
    let degree_id: String
    let grade_id: String
    let user_id:String
   
}
struct base64Data:Encodable{
    let certification_url :String
    let user_id :String
}

struct countryData:Codable {
    let data: [countryResponse]
}

struct countryResponse:Codable {
    let country_id, nicename: String
}

struct languageArr:Codable {
    let data:[languageData]
}
struct languageData:Codable {
    let language_id, language_name: String
}

struct regResponse:Codable {
    let message: String
    let status: Int
}
struct personalResponse:Decodable {
    let message: String
    let status: String
}

struct nationalityData:Codable {
    let data: [natResponse]
}

struct natResponse:Codable {
    let nationality_id, nationality_enNationality,nationality_arNationality: String
}
//{"data":[{"degree_id":"1","degree_name":"Bachelor's Degree"},{"degree_id":"2","degree_name":"mastar's Degree"},{"degree_id":"4","degree_name":"Doctorate Degree"},{"degree_id":"5","degree_name":"MBA"}]}
struct degreeArr:Codable {
    let data: [degreeData]
}
struct degreeData:Codable{
    let degree_id,degree_name :String
}
struct gradeArr:Codable {
    let data: [gradeData]
}
struct gradeData:Codable{
    let grade_id,grade_name :String
}

struct insertCourseData:Encodable {
    let course_name:String
    let organization_name:String
    let start_date:String
    let end_date:String
    let user_id:String
}
struct insertCertData:Encodable{
    let certification_url:String
    let user_id:String
}
struct insertExData:Encodable{
    let company_name:String
    let job_title:String
    let date_start:String
    let date_end:String
    let salary:String
    let reasonforleaving:String
    let user_id:String
}
struct insertSkillData:Encodable {
    let skill_name:String
    let user_id:String
}
struct linksData:Encodable{
    let linkedin:String
    let facebook:String
    let behance:String
    let instgram:String
    let github:String
    let stack_overview:String
    let youtube:String
    let blog:String
    let website:String
    let others:String
    let user_id:String
}
struct postitionDatArr:Codable{
    let data:[postionsData]
}
struct postionsData:Codable{
    let position_id,position_name:String
}
struct carrelLevelDataArr:Codable{
    let data:[careerLevelData]
}
struct careerLevelData:Codable {
    let career_level_id,career_name : String
}
struct employmentData:Encodable {
    let salary:String
    let smoke:String
    let license_drive:String
    let linkcv:String
    let youafterfive:String
    let position_id:String
    let career_level_id:String
    let user_id:String
}
struct examData:Encodable {
    let user_id:String
    let final_degree:String
    let degree_iq:String
    let degree_english:String
}
struct allData:Codable {
    let status: Int
    let data: [allDatuModel]
}

struct allDatuModel:Codable {
    let user_id:String
    let fullname:String
    let email:String
    let mobile: String
    let image_name :String
    let position_name: String
}

struct postUserIdData:Encodable {
  let  user_id : String
}

struct selectedUserData:Codable {
    let data: [allUserData]
}

struct allUserData:Codable {
    let user_id, general_id, fullname, birthday: String
    let address, email, civil_id_no, telephone: String
    let mobile, gender, martial_status, nationality_enNationality: String
    let nicename, city_name, religion_name, image_name: String
    let car_interest_id, salary, smoke, license_drive: String
    let linkcv: String
    let youafterfive, position_name, career_name, college_id: String
    let college_name, graduationyear, education_id, university_name: String
    let fields_study, endyear, degree_name, grade_name: String
    let link_id: String
    let linkedin: String
    let facebook: String
    let behance: String
    let instgram: String
    let github, stack_overview, youtube, blog: String
    let website, others: String
    let skills: [Skill]
    let experiences: [Experience]
    let courses: [Course]
    let certification: [Certification]
}

struct Certification:Codable {
    let certification_id, certification_url: String
}

struct Course:Codable {
    let course_id, course_name, organization_name, start_date: String
    let end_date: String
}

struct Experience:Codable {
    let experience_id, company_name, job_title, date_start: String
    let date_end, salary, reasonforleaving: String
}

struct Skill:Codable {
    let skill_id, skill_name: String
}
