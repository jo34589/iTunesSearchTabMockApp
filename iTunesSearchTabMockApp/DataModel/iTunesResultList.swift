//
//  File.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/07.
//

import Foundation

struct iTunesResultList: Decodable {
    let resultCount: Int
    let results: [iTunesResult]
}

//필요한 정보만 받도록 하자.
struct iTunesResult: Decodable {
    
    let appletvScreenshotUrls: [String]?
    let screenshotUrls: [String]?
    let ipadScreenshotUrls: [String]?
    let artworkUrl60: String?
    let artworkUrl512: String?
    let artworkUrl100: String?
    let artistViewUrl: String?                          //개발자 웹 사이트
    let features: [String]?                             //다른 걸로도 확인 가능
    let supportedDevices: [String]?                     //지원 기기 확인용
    let advisories: [String]?                           //연령등급 더보기에 포함됨
    let isGameCenterEnabled: Bool?                      //있으면 지원 탭(에/과 함께?) 게임센터 표시
    let kind: String?                                   //software 로 검색했기 때문에 반드시 "software"
    let minimumOsVersion: String?                       //호환성 셀 확장했을 때 상세 정보 표시 시 필요
    let trackCensoredName: String?                      //검열된 이름, 필요? 하진 않을 것 같음.
    let languageCodesISO2A: [String]?                   //상단 정보 가로 스크롤에서 언어 란 표시용
    let fileSizeBytes: String?                          //정보 탭 크기 표시용
    let sellerUrl: String?                              //개발자 웹 사이트 url
    let formattedPrice: String?                         //한국어로 무료/유료 표시해줌
    let contentAdvisoryRating: String?                  //연령등급 표시용
    let averageUserRatingForCurrentVersion: Double?     //현재 버젼에 대한 유저 평가 평균
    let userRatingCountForCurrentVersion: Int?          //현재 버젼에 대한 유저 평가 총 수
    let averageUserRating: Double?                      //전체 버젼 유저 평가 평균
    let trackViewUrl: String?                           //공유버튼 때 사용할 URL
    let trackContentRating: String?                     //상단정보 연령등급
    let bundleId: String?                               //표시할 필요 없음.
    var trackId: Int                                    //표시되지 않음.
    let trackName: String?                              //검열된 이름보단 나을거임
    let releaseDate: String?                            //최초 베포 일시, 아주아주 제한된 상황에서 쓰일 듯 함.
    let genreIds: [String]?                             //알아볼 수 있는 방법이 없음
    let primaryGenreName: String?                       //가장 바깥에 표시 될 장르
    let isVppDeviceBasedLicensingEnabled: Bool?         //라이선스 일괄 구매 기능 있는지 여부. 표시되지 않음.
    let sellerName: String?                             //하단 정보 제공자 셀에 들어가는 이름
    let currentVersionReleaseDate: String?              //현 버젼 베포 일자
    let releaseNotes: String?                           //현 버젼 베포할 때 개발노트
    let primaryGenreId: Int?                            //못알아봄 장르 이름이 아니라 ID 숫자로 되어 있음.
    let currency: String?                               //사용하는 통화(화폐)
    let version: String?                                //버젼정보
    let wrapperType: String?                            //software
    let artistId: Int?                                  //개발자 id
    let artistName: String?                             //앱 이름 바로 아래 들어가는 개발자 이름
    let genres: [String]?                               //장르 이름들
    let price: Float?                                   //가격, 0이면 버튼이 '받기'
    let description: String?                            //더보기로 처리해야 할 앱 설명
    let userRatingCount: Int?                           //사용자 평가 카운트
}

let sampleResult = iTunesResultList(resultCount: 1, results: [
    iTunesResult(
        appletvScreenshotUrls:[],
        screenshotUrls:[
            "https://is5-ssl.mzstatic.com/image/thumb/Purple2/v4/5e/e0/37/5ee0376e-efa9-a65d-7d44-09def8b32020/5bceaea3-bc17-47b6-aeb4-1f6d8e56b292_A-iPhone-55-1_ko-KR.png/392x696bb.png",
            "https://is3-ssl.mzstatic.com/image/thumb/Purple2/v4/6b/70/70/6b70702a-fd09-3414-f4ba-303e02b18e64/f33369df-ee16-4c60-b69a-c5574c7c0420_A-iPhone-55-2_ko-KR.png/392x696bb.png",
            "https://is2-ssl.mzstatic.com/image/thumb/Purple2/v4/b4/38/dc/b438dc33-a416-5825-de1c-234318255643/b4c861f1-4dc7-4cd4-9daf-b6e801dd0228_A-iPhone-55-3_ko-KR.png/392x696bb.png",
            "https://is4-ssl.mzstatic.com/image/thumb/Purple2/v4/2d/76/fb/2d76fbee-4691-709a-9a62-4e10261798b6/7b827077-0458-4d66-9808-18a2ea518769_A-iPhone-55-4_ko-KR.png/392x696bb.png",
            "https://is2-ssl.mzstatic.com/image/thumb/Purple2/v4/41/f6/f9/41f6f9c9-b73b-93e0-699e-76f8a0cae6da/4c506ca1-0e99-4daa-874d-205fc40dd68b_A-iPhone-55-5_ko-KR.png/392x696bb.png",
            "https://is1-ssl.mzstatic.com/image/thumb/Purple2/v4/2a/d5/d2/2ad5d2f4-d1d4-7bd6-da71-02e5db603623/ea78208f-dfcb-4935-9cf5-71f3df84ce87_A-iPhone-55-6_ko-KR.png/392x696bb.png"],
        ipadScreenshotUrls:[
            "https://is5-ssl.mzstatic.com/image/thumb/PurpleSource112/v4/1f/74/1e/1f741e95-1253-a848-d7da-b021a2c9d788/f31d678b-2eb3-4b54-972a-87eae79090ed_iPad-1_ko-KR.png/552x414bb.png",
            "https://is4-ssl.mzstatic.com/image/thumb/PurpleSource112/v4/55/c7/4c/55c74ce6-a815-2551-f98b-51a853fbb7a7/b65c8e77-7271-413e-8b4a-0706a080fd46_iPad-2_ko-KR.png/552x414bb.png",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource112/v4/c4/02/ea/c402ea3c-a48d-151c-91ef-a01c048a24e4/0d314695-6017-47a5-97e6-1d2dafb72d6e_iPad-3_ko-KR.png/552x414bb.png",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource112/v4/1d/ea/b6/1deab6fd-2a2f-7dd4-29b3-a41501fd4dea/d5a3a7c2-5146-4618-98f2-a8cbc4bd16f1_iPad-4_ko-KR.png/552x414bb.png"],
        artworkUrl60:"https://is3-ssl.mzstatic.com/image/thumb/Purple122/v4/1a/fd/97/1afd97fd-966a-2d4e-38d4-ef1f7201f716/AppIcon-1x_U007emarketing-0-7-0-0-0-85-220-0.png/60x60bb.jpg",
        artworkUrl512:"https://is3-ssl.mzstatic.com/image/thumb/Purple122/v4/1a/fd/97/1afd97fd-966a-2d4e-38d4-ef1f7201f716/AppIcon-1x_U007emarketing-0-7-0-0-0-85-220-0.png/512x512bb.jpg",
        artworkUrl100:"https://is3-ssl.mzstatic.com/image/thumb/Purple122/v4/1a/fd/97/1afd97fd-966a-2d4e-38d4-ef1f7201f716/AppIcon-1x_U007emarketing-0-7-0-0-0-85-220-0.png/100x100bb.jpg",
        artistViewUrl:"https://apps.apple.com/kr/developer/airbnb-inc/id401626266?uo=4",
        features:["iosUniversal"],
        supportedDevices:["iPhone5s-iPhone5s", "iPadAir-iPadAir", "iPadAirCellular-iPadAirCellular", "iPadMiniRetina-iPadMiniRetina", "iPadMiniRetinaCellular-iPadMiniRetinaCellular", "iPhone6-iPhone6", "iPhone6Plus-iPhone6Plus", "iPadAir2-iPadAir2", "iPadAir2Cellular-iPadAir2Cellular", "iPadMini3-iPadMini3", "iPadMini3Cellular-iPadMini3Cellular", "iPodTouchSixthGen-iPodTouchSixthGen", "iPhone6s-iPhone6s", "iPhone6sPlus-iPhone6sPlus", "iPadMini4-iPadMini4", "iPadMini4Cellular-iPadMini4Cellular", "iPadPro-iPadPro", "iPadProCellular-iPadProCellular", "iPadPro97-iPadPro97", "iPadPro97Cellular-iPadPro97Cellular", "iPhoneSE-iPhoneSE", "iPhone7-iPhone7", "iPhone7Plus-iPhone7Plus", "iPad611-iPad611", "iPad612-iPad612", "iPad71-iPad71", "iPad72-iPad72", "iPad73-iPad73", "iPad74-iPad74", "iPhone8-iPhone8", "iPhone8Plus-iPhone8Plus", "iPhoneX-iPhoneX", "iPad75-iPad75", "iPad76-iPad76", "iPhoneXS-iPhoneXS", "iPhoneXSMax-iPhoneXSMax", "iPhoneXR-iPhoneXR", "iPad812-iPad812", "iPad834-iPad834", "iPad856-iPad856", "iPad878-iPad878", "iPadMini5-iPadMini5", "iPadMini5Cellular-iPadMini5Cellular", "iPadAir3-iPadAir3", "iPadAir3Cellular-iPadAir3Cellular", "iPodTouchSeventhGen-iPodTouchSeventhGen", "iPhone11-iPhone11", "iPhone11Pro-iPhone11Pro", "iPadSeventhGen-iPadSeventhGen", "iPadSeventhGenCellular-iPadSeventhGenCellular", "iPhone11ProMax-iPhone11ProMax", "iPhoneSESecondGen-iPhoneSESecondGen", "iPadProSecondGen-iPadProSecondGen", "iPadProSecondGenCellular-iPadProSecondGenCellular", "iPadProFourthGen-iPadProFourthGen", "iPadProFourthGenCellular-iPadProFourthGenCellular", "iPhone12Mini-iPhone12Mini", "iPhone12-iPhone12", "iPhone12Pro-iPhone12Pro", "iPhone12ProMax-iPhone12ProMax", "iPadAir4-iPadAir4", "iPadAir4Cellular-iPadAir4Cellular", "iPadEighthGen-iPadEighthGen", "iPadEighthGenCellular-iPadEighthGenCellular", "iPadProThirdGen-iPadProThirdGen", "iPadProThirdGenCellular-iPadProThirdGenCellular", "iPadProFifthGen-iPadProFifthGen", "iPadProFifthGenCellular-iPadProFifthGenCellular", "iPhone13Pro-iPhone13Pro", "iPhone13ProMax-iPhone13ProMax", "iPhone13Mini-iPhone13Mini", "iPhone13-iPhone13", "iPadMiniSixthGen-iPadMiniSixthGen", "iPadMiniSixthGenCellular-iPadMiniSixthGenCellular", "iPadNinthGen-iPadNinthGen", "iPadNinthGenCellular-iPadNinthGenCellular", "iPhoneSEThirdGen-iPhoneSEThirdGen", "iPadAirFifthGen-iPadAirFifthGen", "iPadAirFifthGenCellular-iPadAirFifthGenCellular"],
        advisories:[],
        isGameCenterEnabled:false,
        kind:"software",
        minimumOsVersion:"14.0",
        trackCensoredName:"Airbnb",
        languageCodesISO2A:["SQ", "AR", "HY", "AZ", "BS", "BG", "CA", "HR", "CS", "DA", "NL", "EN", "ET", "FI", "FR", "KA", "DE", "EL", "HE", "HI", "HU", "IS", "ID", "GA", "IT", "JA", "KO", "LV", "LT", "MK", "MS", "MT", "NB", "PL", "PT", "RO", "RU", "SR", "ZH", "SK", "SL", "ES", "SW", "SV", "TL", "TH", "ZH", "TR", "UK", "VI", "XH", "ZU"],
        fileSizeBytes:"253249536",
        sellerUrl:"https://ko.airbnb.com",
        formattedPrice:"무료",
        contentAdvisoryRating:"4+",
        averageUserRatingForCurrentVersion:4.63825999999999982748022375744767487049102783203125,
        userRatingCountForCurrentVersion:39125,
        averageUserRating:4.63825999999999982748022375744767487049102783203125,
        trackViewUrl:"https://apps.apple.com/kr/app/airbnb/id401626263?uo=4",
        trackContentRating:"4+",
        bundleId:"com.airbnb.app",
        trackId:401626263,
        trackName:"Airbnb",
        releaseDate:"2010-11-10T20:28:11Z",
        genreIds:["6003", "6012"],
        primaryGenreName:"Travel",
        isVppDeviceBasedLicensingEnabled:true,
        sellerName:"Airbnb, Inc.",
        currentVersionReleaseDate:"2022-05-25T17:21:36Z",
        releaseNotes:"모든 것이 새로워졌습니다. 업무 유연성이 강화되면서 그 어느 때보다도 자유롭게 여행지와 여행 날짜를 선택할 수 있는 시대가 되었습니다. 에어비앤비는 게스트가 이러한 새로운 가능성을 적극 활용할 수 있도록 '에어비앤비 카테고리'를 통한 새로운 검색 방법, '나눠서 숙박'을 통해 더 오래 머물 수 있는 방법, '에어커버'를 통해 타의 추종을 불허하는 수준의 무료 여행 보호 장치를 선보입니다. 무한한 가능성의 세계를 만나보세요.",
        primaryGenreId:6003,
        currency:"KRW",
        version:"22.21",
        wrapperType:"software",
        artistId:401626266,
        artistName:"Airbnb, Inc.",
        genres:["여행", "라이프 스타일"],
        price:0.00,
        description:"수백만 개의 다양한 숙소를 만나보세요\n가까운 국내 지역부터 멀리 있는 외국까지, 전 세계의 독특한 숙소 중에서 선택하세요. 국립공원 근처의 숙소부터 대도시 중심가에 있는 아파트까지 다양한 숙소를 둘러보고 앱에서 바로 예약하실 수 있습니다.\n\n이색적인 숙소를 찾아보세요\n에어비앤비 카테고리로 새로워진 검색 방법을 통해 게스트는 에어비앤비에서 숙소를 쉽게 둘러볼 수 있고, 찾아볼 생각조차 하지 못했을 숙소를 발견하는 재미도 느낄 수 있습니다. 독특한 디자인의 숙소, 열대 지역이나 서핑 명소 근처의 숙소 등 어떤 곳을 원하든 스타일이나 위치, 즐길 거리를 바탕으로 숙소를 선정해 카테고리별로 선보입니다.\n \n더 오래 머물면서 다양한 경험을 즐기세요 \n나눠서 숙박 기능은 한 번의 여행에서 숙소 두 곳에 나눠서 머물 수 있도록 시스템이 자동으로 제안해주는 혁신적인 새로운 기능입니다. 일주일 이상의 여행을 검색할 때 자동으로 표시되므로, 게스트가 예약 가능한 숙소를 더 많이 검색하고 여행에서 더 많은 경험을 얻을 수 있습니다.\n \n타의 추종을 불허하는 수준의 보호를 누리세요\n에어커버는 여행 전반에 걸친 가장 포괄적인 무료 보호 장치로, 문제가 발생해도 에어비앤비의 지원을 받을 수 있다는 믿음을 주어 게스트가 안심하고 여행할 수 있습니다.\n \n호스트와 메시지를 주고받고, 간편하게 체크인하세요\n어디에서나 내 집처럼 편안하게 머물러보세요. 게스트는 에어비앤비 앱을 이용해 호스트와 메시지를 주고받고, 예약 관련 최신 정보를 받아볼 수 있습니다. 또한, 현지에 정통한 호스트가 알려주는 유용한 정보를 최대한 활용해 특별하고 편안한 여행을 즐길 수 있습니다. 새롭게 디자인된 '여행' 탭은 필수 여행 정보를 모두 한곳에서 보여줍니다. 체크인 세부 정보도 여기서 확인할 수 있으므로, 숙소에 찾아가는 것부터 체크인, 와이파이 연결까지 모두 쉽게 하실 수 있어요.\n \n필요한 요건을 모두 갖춘 숙소를 선택하세요\n숙소의 모든 접근성 편의시설은 접근성 검토 절차를 통해 에어비앤비 전문가 팀의 확인을 거칩니다. 계단 없이 출입 가능한 침실, 접근성이 용이한 주차 공간 등 13개의 접근성 검색 필터로 조건에 맞는 숙소를 쉽게 찾을 수 있습니다.\n \n흥미진진한 즐길 거리를 찾아보세요\n현지인이 이끄는 독특한 액티비티를 통해 현지 문화를 체험하거나, 안방에서 편안하게 랜선 여행을 즐겨보세요. 나 홀로 참여할 수도 있고, 프라이빗 예약을 통해 체험 전체를 예약하거나, 그룹에 참여해 새로운 인연을 만들 수도 있습니다. 에어비앤비 앱을 이용해 취향과 관심사, 연령대에 알맞은 체험을 골라 예약해보세요. 위시리스트에 저장하거나 지인과 공유할 수도 있어요.\n\n간단한 10단계로 호스팅을 시작해보세요 \n남는 공간을 활용해 에어비앤비에서 호스팅 수입을 올려보세요. 에어비앤비 앱에서 바로 숙소를 등록한 다음, 에어비앤비에서 제공하는 지원과 유용한 정보를 바탕으로 호스팅을 시작해보세요. 호스팅은 정말 좋아하는 일에 몰두할 수 있도록 부수입을 창출하는 동시에 누군가에게 다음 여행을 위한 영감을 줄 수 있는 멋진 기회입니다.\n\n숙소 보호 장치로 안심하고 호스팅\n호스트를 위한 에어커버는 호스팅 전반에 걸친 보호를 제공하며, 여기에는 1백만 달러 책임보험, 1백만 달러 손해보상 등 다양한 보장이 포함됩니다. 모든 호스트에게 언제나 무료로, 오직 에어비앤비에서만 제공됩니다.",
        userRatingCount:39125
        )
])
