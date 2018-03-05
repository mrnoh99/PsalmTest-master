

import Foundation

// Runs query data task, and stores results in array of Tracks
class QueryService {
  let koreanName: String = "시편"
  let englishName: String = "Psalm"
  let numberOfChapters: Int = 150 //150
  let identityCode: String = "123"
  
  

  // 1
  let defaultSession = URLSession(configuration: .default)
  // 2
  var dataTask: URLSessionDataTask?
  var tracks: [Track] = []
  var errorMessage = ""

  func getSearchResults()-> [Track]{
   
    var index = 0
    for i in 1...self.numberOfChapters  {
      if let previewURLString = "http://archive.catholic.or.kr/mobile/bible/"+self.identityCode + "/"+self.identityCode + "_" + "\(i)"+".mp3" as String? ,
        let previewURL = URL(string: previewURLString) ,
        let artist  = self.identityCode + "_" + "\(i)"+".mp3" as String?,
        let name  = self.koreanName + " " + "\(i) 편"as String? {
        tracks.append(Track(name: name, artist: artist, previewURL: previewURL, index: index))
        index += 1
      } else {
        errorMessage += "Problem parsing trackDictionary\n"
      }
    }
    return tracks
  }

}
