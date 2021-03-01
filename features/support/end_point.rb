# This file contains all the end point related to the system
module EndPoint

	BASEURLV2 = "https://the-one-api.dev/v2"
	
	GETBOOKS = BASEURLV2 + "/book"
	GETBOOK = GETBOOKS + "/%s"
	GETBOOKCHAPTER = GETBOOK + "/chapter"
	
	GETMOVIES = BASEURLV2 + "/movie"
	GETMOVIE = GETMOVIES + "/%s"
	GETMOVIE_QUOTE = GETMOVIE + "/quote"

	GETCHARACTERS = BASEURLV2 + "/character"
	GETCHARACTER = GETCHARACTERS + "/%s"
	GETCHARACTER_QUOTE = GETCHARACTER + "/quote"

	GETQUOTES = BASEURLV2 + "/quote"
	GETQUOTE = GETQUOTES + "/%s"

	GETCHAPTERS = BASEURLV2 + "/chapter"
	GETCHAPTER = GETCHAPTERS + "/%s"
	
end