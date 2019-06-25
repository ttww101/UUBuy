import UIKit
import SnapKit
import Alamofire
import CommonCrypto

//extension String {
//    func md5() -> String {
//        let str = self.cString(using: String.Encoding.utf8)
//        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
//        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
//        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
//        CC_MD5(str!, strLen, result)
//        let hash = NSMutableString()
//        for i in 0 ..< digestLen {
//            hash.appendFormat("%02x", result[i])
//        }
//        free(result)
//        return String(format: hash as String)
//    }
//}
//
//let calendar = Calendar.current
//let date = calendar.date(byAdding: .minute, value: -5, to: Date())!
//
//let dateFormatterGet = DateFormatter()
//dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
//let ts = dateFormatterGet.string(from: Date())
//
//let pay_memberid = "10113"
//var pay_orderid = "09f7eyy1yg6hutk3jrd8"
//var pay_applydate = ts
//let pay_bankcode = "902"
//let pay_notifyurl = "https://example.com"
//let pay_callbackurl = "https://example.com"
//let pay_amount = "10"
//let pay_productname = "測試商品"
//
////pay_applydate = "2019-06-25 11:31:15"
//
//let str = "pay_amount=\(pay_amount)&pay_applydate=\(pay_applydate)&pay_bankcode=\(pay_bankcode)&pay_callbackurl=\(pay_callbackurl)&pay_memberid=\(pay_memberid)&pay_notifyurl=\(pay_notifyurl)&pay_orderid=\(pay_orderid)&key=03t0qntryrk48cfnchsumkojeuxuu737"
//print(str)
//var pay_md5sign = str.md5().uppercased()
//
////pay_orderid = "09f7eyy1y96hktk3kaa0"
////pay_applydate = "2019-06-25 09:59:15"
////pay_md5sign = "E8D206CEB5F097712A412720B4AB537A"
//
//let parameters = [
//    "pay_memberid": pay_memberid,
//    "pay_orderid": pay_orderid,
//    "pay_applydate": pay_applydate,
//    "pay_bankcode": pay_bankcode,
//    "pay_notifyurl": pay_notifyurl,
//    "pay_callbackurl": pay_callbackurl,
//    "pay_amount": pay_amount,
//    "pay_md5sign": pay_md5sign,
//    "pay_productname": pay_productname
//]
//
////let dict = {
////    pay_amount: pay_amount,
////    pay_applydate: pay_applydate,
////    pay_bankcode: pay_bankcode,
////    pay_callbackurl: pay_callbackurl,
////    pay_memberid: pay_memberid,
////    pay_notifyurl: pay_notifyurl,
////    pay_orderid: pay_orderid,
////
////}
//
//let headers = [
//    "Content-Type": "application/x-www-form-urlencoded"
//]
//Alamofire.request("http://www.lodewn.cn/Pay_Index.html", method: .post, parameters: parameters, encoding: URLEncoding(), headers: headers).response { (response) in
//    print(response.request)
//    print(response.response)
//    print(String(data: response.data!, encoding: .utf8))
//
//    print(response.error)
//}
//
//Alamofire.request("http://www.lodewn.cn/Pay_Index.html", method: .post, parameters: parameters, encoding: URLEncoding(), headers: headers).response { (response) in
//    print(response.request)
//    print(response.response)
//    print(String(data: response.data!, encoding: .utf8))
//
//    print(response.error)
//}

func randomString(len:Int) -> String {
    let charSet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var c = Array(charSet)
    var s:String = ""
    for n in (1...len) {
        s.append(c[Int(arc4random()) % c.count])
    }
    return s
}

randomString(len: 20)
