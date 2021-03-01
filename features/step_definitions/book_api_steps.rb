Given('I choose {string} api') do |string|
  @end_point = EndPoint.module_eval("GET#{string}")
end

When /^I hit the endpoint$/ do
  @api_response = RestWrapper.get_call(url: @end_point, headers: @headers)
end

Then /^I should see only "(.*?)" books returned in the response$/ do |books_count|
  expect(@api_response[:data]["docs"].count).to eq books_count.to_i
  expect(@api_response[:data]["total"].to_i).to eq books_count.to_i
end

When('I choose any book id') do
  book_data = @api_response[:data]["docs"].sample
  @id = book_data["_id"]
  @book_name = book_data["name"]
  @end_point = EndPoint::GETBOOK % @id
end

When('I choose selected Book api with book id as {string}') do |string|
  @id = string
  @end_point = EndPoint::GETBOOK % @id
end

Then('I should see only the respective book details') do
  expect(@api_response[:data]["docs"].count).to eq 1
  expect(@api_response[:data]["docs"].first["_id"]).to eq @id
  expect(@api_response[:data]["total"].to_i).to eq 1
end

Then('I should see error message') do
  expect(@api_response[:data]["success"]).to be_falsy
  expect(@api_response[:data]["message"]).to eq "Something went wrong."
end

Given('I choose selected BookChapter api with book id as {string}') do |string|
  @id = string
  @end_point = EndPoint::GETBOOK % @id
end

When('I choose selected BookChapter api') do
  @end_point = EndPoint::GETBOOKCHAPTER % @id
end

Then('I should see only the respective book chapters') do
  expect(@api_response[:data]["docs"].map{|book| book["bookName"]}.uniq).to eq [@book_name]
end