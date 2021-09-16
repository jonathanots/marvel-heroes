const heroComicsResponseGET200 = """
{
  "code": 200,
  "status": "Ok",
  "copyright": "© 2021 MARVEL",
  "attributionText": "Data provided by Marvel. © 2021 MARVEL",
  "etag": "84fde156610ce8f231f90d61ce7a895de25428c9",
  "data": {
    "offset": 3,
    "limit": 3,
    "total": 14,
    "count": 3,
    "results": [
      {
        "id": 40774,
        "digitalId": 27607,
        "title": "Dark Avengers (2012) #180",
        "issueNumber": 180,
        "variantDescription": "",
        "description":
            "* The Dark Avengers' operation sets off what will become known as THE CATACLYSM* Songbird finds out a deadly secret conspiracy to destroy The Dark Avengers, Luke Cage and the Thunderbolts - Forever!* Neil Edwards (SPIDER-MAN: SEASON ONE) joins Jeff Parker for the defining chapter in the Dark Avengers legacy!!",
        "modified": "2014-07-31T15:58:28-0400",
        "isbn": "",
        "upc": "5960605602-18011",
        "diamondCode": "",
        "ean": "",
        "issn": "1094-1258",
        "format": "Comic",
        "pageCount": 32,
        "textObjects": [
          {
            "type": "issue_solicit_text",
            "language": "en-us",
            "text":
                "* The Dark Avengers' operation sets off what will become known as THE CATACLYSM* Songbird finds out a deadly secret conspiracy to destroy The Dark Avengers, Luke Cage and the Thunderbolts - Forever!* Neil Edwards (SPIDER-MAN: SEASON ONE) joins Jeff Parker for the defining chapter in the Dark Avengers legacy!!"
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/40774",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/40774/dark_avengers_2012_180?utm_campaign=apiRef&utm_source=43a9f59bcc99d157be8cc636c74d8504"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Dark-Avengers-180/digital-comic/27607?utm_campaign=apiRef&utm_source=43a9f59bcc99d157be8cc636c74d8504"
          },
          {"type": "reader", "url": "http://marvel.com/digitalcomics/view.htm?iid=27607&utm_campaign=apiRef&utm_source=43a9f59bcc99d157be8cc636c74d8504"},
          {"type": "inAppLink", "url": "https://applink.marvel.com/issue/27607?utm_campaign=apiRef&utm_source=43a9f59bcc99d157be8cc636c74d8504"}
        ],
        "series": {"resourceURI": "http://gateway.marvel.com/v1/public/series/789", "name": "Dark Avengers (2012 - 2013)"},
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {"type": "onsaleDate", "date": "2012-09-05T00:00:00-0400"},
          {"type": "focDate", "date": "2012-08-21T00:00:00-0400"},
          {"type": "unlimitedDate", "date": "2013-03-08T13:18:30-0500"},
          {"type": "digitalPurchaseDate", "date": "2012-09-05T00:00:00-0400"}
        ],
        "prices": [
          {"type": "printPrice", "price": 2.99},
          {"type": "digitalPurchasePrice", "price": 1.99}
        ],
        "thumbnail": {"path": "http://i.annihil.us/u/prod/marvel/i/mg/a/20/519679ce2b8ec", "extension": "jpg"},
        "images": [
          {"path": "http://i.annihil.us/u/prod/marvel/i/mg/a/20/519679ce2b8ec", "extension": "jpg"}
        ],
        "creators": {
          "available": 7,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40774/creators",
          "items": [
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/11647", "name": "Tom Brennan", "role": "editor"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/5251", "name": "Vc Joe Caramagna", "role": "letterer"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/10405", "name": "John Tyler Christopher", "role": "penciller (cover)"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/10115", "name": "Neil Edwards", "role": "artist"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/1371", "name": "Terry Pallot", "role": "inker"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/824", "name": "Jeff Parker", "role": "writer"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/500", "name": "Christopher Sotomayor", "role": "colorist"}
          ],
          "returned": 7
        },
        "characters": {
          "available": 12,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40774/characters",
          "items": [
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1010699", "name": "Aaron Stack"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1010371", "name": "Boomerang"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1011367", "name": "Dark Avengers"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1009215", "name": "Luke Cage"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1010851", "name": "Mach IV"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1009420", "name": "Man-Thing"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1010347", "name": "Mr. Hyde"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1011035", "name": "Satana"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1011223", "name": "Skaar"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1010693", "name": "Songbird"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1016452", "name": "Spider-Man (Ai Apaec)"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1010360", "name": "Thunderbolts"}
          ],
          "returned": 12
        },
        "stories": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40774/stories",
          "items": [
            {"resourceURI": "http://gateway.marvel.com/v1/public/stories/92372", "name": "Dark Avengers (2012) #180", "type": "cover"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/stories/92373", "name": "Interior #92373", "type": "interiorStory"}
          ],
          "returned": 2
        },
        "events": {"available": 0, "collectionURI": "http://gateway.marvel.com/v1/public/comics/40774/events", "items": [], "returned": 0}
      },
      {
        "id": 40773,
        "digitalId": 27468,
        "title": "Dark Avengers (2012) #179",
        "issueNumber": 179,
        "variantDescription": "",
        "description":
            "THE DARK AVENGERS AND THE THUNDERBOLTS ARE ON A COLLISION COURSE - THROUGH TIME!- Can history's most Wanted villains save Luke Cage from his future?!- Jeff Parker, Declan Shalvey and Kev Walker unite for an epic tale of one man's destiny!",
        "modified": "2014-07-31T15:58:25-0400",
        "isbn": "",
        "upc": "5960605602-17911",
        "diamondCode": "",
        "ean": "",
        "issn": "1094-1258",
        "format": "Comic",
        "pageCount": 32,
        "textObjects": [
          {
            "type": "issue_solicit_text",
            "language": "en-us",
            "text":
                "THE DARK AVENGERS AND THE THUNDERBOLTS ARE ON A COLLISION COURSE - THROUGH TIME!- Can history's most Wanted villains save Luke Cage from his future?!- Jeff Parker, Declan Shalvey and Kev Walker unite for an epic tale of one man's destiny!"
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/40773",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/40773/dark_avengers_2012_179?utm_campaign=apiRef&utm_source=43a9f59bcc99d157be8cc636c74d8504"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Dark-Avengers-179/digital-comic/27468?utm_campaign=apiRef&utm_source=43a9f59bcc99d157be8cc636c74d8504"
          },
          {"type": "reader", "url": "http://marvel.com/digitalcomics/view.htm?iid=27468&utm_campaign=apiRef&utm_source=43a9f59bcc99d157be8cc636c74d8504"},
          {"type": "inAppLink", "url": "https://applink.marvel.com/issue/27468?utm_campaign=apiRef&utm_source=43a9f59bcc99d157be8cc636c74d8504"}
        ],
        "series": {"resourceURI": "http://gateway.marvel.com/v1/public/series/789", "name": "Dark Avengers (2012 - 2013)"},
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {"type": "onsaleDate", "date": "2012-08-15T00:00:00-0400"},
          {"type": "focDate", "date": "2012-07-31T00:00:00-0400"},
          {"type": "unlimitedDate", "date": "2013-03-08T13:18:06-0500"},
          {"type": "digitalPurchaseDate", "date": "2012-08-15T00:00:00-0400"}
        ],
        "prices": [
          {"type": "printPrice", "price": 2.99},
          {"type": "digitalPurchasePrice", "price": 1.99}
        ],
        "thumbnail": {"path": "http://i.annihil.us/u/prod/marvel/i/mg/f/03/519678a1d8705", "extension": "jpg"},
        "images": [
          {"path": "http://i.annihil.us/u/prod/marvel/i/mg/f/03/519678a1d8705", "extension": "jpg"}
        ],
        "creators": {
          "available": 7,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40773/creators",
          "items": [
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/11647", "name": "Tom Brennan", "role": "editor"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/5251", "name": "Vc Joe Caramagna", "role": "letterer"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/10405", "name": "John Tyler Christopher", "role": "penciller (cover)"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/4991", "name": "Frank Martin", "role": "colorist"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/824", "name": "Jeff Parker", "role": "writer"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/11354", "name": "Declan Shalvey", "role": "artist"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/234", "name": "Kev Walker", "role": "artist"}
          ],
          "returned": 7
        },
        "characters": {
          "available": 11,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40773/characters",
          "items": [
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1010699", "name": "Aaron Stack"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1010371", "name": "Boomerang"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1011367", "name": "Dark Avengers"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1009215", "name": "Luke Cage"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1009420", "name": "Man-Thing"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1010347", "name": "Mr. Hyde"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1011035", "name": "Satana"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1011223", "name": "Skaar"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1010693", "name": "Songbird"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1016452", "name": "Spider-Man (Ai Apaec)"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1010360", "name": "Thunderbolts"}
          ],
          "returned": 11
        },
        "stories": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40773/stories",
          "items": [
            {"resourceURI": "http://gateway.marvel.com/v1/public/stories/92370", "name": "Dark Avengers (2012) #179", "type": "cover"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/stories/92371", "name": "Interior #92371", "type": "interiorStory"}
          ],
          "returned": 2
        },
        "events": {"available": 0, "collectionURI": "http://gateway.marvel.com/v1/public/comics/40773/events", "items": [], "returned": 0}
      },
      {
        "id": 40776,
        "digitalId": 27172,
        "title": "Dark Avengers (2012) #177",
        "issueNumber": 177,
        "variantDescription": "",
        "description":
            "<ul><li> The TimeStream-TravelingThunderbolts battle Dr. Doom in the past for the fate of the future!</li><li> Skaar discovers the secret agenda of the Dark Avengers! </li></ul>",
        "modified": "2014-07-31T15:58:22-0400",
        "isbn": "",
        "upc": "5960605602-17711",
        "diamondCode": "MAY120659",
        "ean": "",
        "issn": "1094-1258",
        "format": "Comic",
        "pageCount": 32,
        "textObjects": [
          {
            "type": "issue_solicit_text",
            "language": "en-us",
            "text":
                "<ul><li> The TimeStream-TravelingThunderbolts battle Dr. Doom in the past for the fate of the future!</li><li> Skaar discovers the secret agenda of the Dark Avengers! </li></ul>"
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/40776",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/40776/dark_avengers_2012_177?utm_campaign=apiRef&utm_source=43a9f59bcc99d157be8cc636c74d8504"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Dark-Avengers-177/digital-comic/27172?utm_campaign=apiRef&utm_source=43a9f59bcc99d157be8cc636c74d8504"
          },
          {"type": "reader", "url": "http://marvel.com/digitalcomics/view.htm?iid=27172&utm_campaign=apiRef&utm_source=43a9f59bcc99d157be8cc636c74d8504"},
          {"type": "inAppLink", "url": "https://applink.marvel.com/issue/27172?utm_campaign=apiRef&utm_source=43a9f59bcc99d157be8cc636c74d8504"}
        ],
        "series": {"resourceURI": "http://gateway.marvel.com/v1/public/series/789", "name": "Dark Avengers (2012 - 2013)"},
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {"type": "onsaleDate", "date": "2012-07-11T00:00:00-0400"},
          {"type": "focDate", "date": "2012-06-26T00:00:00-0400"},
          {"type": "unlimitedDate", "date": "2013-04-08T00:00:00-0400"},
          {"type": "digitalPurchaseDate", "date": "2012-07-11T00:00:00-0400"}
        ],
        "prices": [
          {"type": "printPrice", "price": 2.99},
          {"type": "digitalPurchasePrice", "price": 1.99}
        ],
        "thumbnail": {"path": "http://i.annihil.us/u/prod/marvel/i/mg/f/b0/519678bcecbaf", "extension": "jpg"},
        "images": [
          {"path": "http://i.annihil.us/u/prod/marvel/i/mg/f/b0/519678bcecbaf", "extension": "jpg"}
        ],
        "creators": {
          "available": 8,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40776/creators",
          "items": [
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/11647", "name": "Tom Brennan", "role": "editor"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/5251", "name": "Vc Joe Caramagna", "role": "letterer"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/10405", "name": "John Tyler Christopher", "role": "penciller (cover)"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/428", "name": "Antonio Fabela", "role": "colorist"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/4991", "name": "Frank Martin", "role": "colorist"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/824", "name": "Jeff Parker", "role": "writer"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/11354", "name": "Declan Shalvey", "role": "artist"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/creators/234", "name": "Kev Walker", "role": "artist"}
          ],
          "returned": 8
        },
        "characters": {
          "available": 12,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40776/characters",
          "items": [
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1010699", "name": "Aaron Stack"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1010371", "name": "Boomerang"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1011367", "name": "Dark Avengers"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1009281", "name": "Doctor Doom"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1009215", "name": "Luke Cage"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1009420", "name": "Man-Thing"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1010347", "name": "Mr. Hyde"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1011360", "name": "Red Hulk"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1011035", "name": "Satana"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1011223", "name": "Skaar"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1016452", "name": "Spider-Man (Ai Apaec)"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/characters/1010360", "name": "Thunderbolts"}
          ],
          "returned": 12
        },
        "stories": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40776/stories",
          "items": [
            {"resourceURI": "http://gateway.marvel.com/v1/public/stories/92376", "name": "Dark Avengers (2012) #177", "type": "cover"},
            {"resourceURI": "http://gateway.marvel.com/v1/public/stories/92377", "name": "Interior #92377", "type": "interiorStory"}
          ],
          "returned": 2
        },
        "events": {"available": 0, "collectionURI": "http://gateway.marvel.com/v1/public/comics/40776/events", "items": [], "returned": 0}
      }
    ]
  }
}
""";
