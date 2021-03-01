MOVIEAPIKEYS = ["_id", "name", "runtimeInMinutes",
								"budgetInMillions", "boxOfficeRevenueInMillions", "academyAwardNominations",
								"academyAwardWins", "rottenTomatesScore"
								]
MOVIENAMES = ["The Lord of the Rings Series", "The Hobbit Series",
							"The Unexpected Journey", "The Desolation of Smaug",
							"The Battle of the Five Armies", "The Two Towers ",
							"The Fellowship of the Ring", "The Return of the King"
							]

Then('I should see Unauthorized message') do
  expect(@api_response[:data]["success"]).to be_falsy
  expect(@api_response[:data]["message"]).to eq	"Unauthorized."
  expect(@api_response[:status]).to eq 401
end

When('I add Bearer token') do
	@headers = {
							"Authorization" => Token::BEARERTOKEN,
							"User-Agent" => Token::USERAGENT
							}
end

Given('I choose a valid movie quote api without bearer token') do
  @id = "3c1nv0lid3ovie1d"
  @end_point = EndPoint::GETMOVIE_QUOTE % @id
end

When('I choose any movie id') do
  movie_data = @api_response[:data]["docs"].sample
  @id = movie_data["_id"]
  @movie_name = movie_data["name"]
end

Then('I should see movies list in the response') do
	expect(@api_response[:status]).to eq 200
	expect(@api_response[:data]["docs"].count).to eq @api_response[:data]["total"]
	expect(@api_response[:data]["docs"].map(&:keys).uniq.flatten).to match_array MOVIEAPIKEYS
	expect(@api_response[:data]["docs"].map{|movie| movie["name"]}).to match_array MOVIENAMES
end

And('I choose selected movieQuote api') do
  @end_point = EndPoint::GETMOVIE_QUOTE % @id
end

# Since API doesnot return data, hence checking only the status
Then('I should see only the respective movie quotes') do
	expect(@api_response[:status]).to eq 200
end