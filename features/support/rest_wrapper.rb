# Rest Wrapper for all API calls
module RestWrapper

  # Specific to get call
  # Can add headers, params body in future specific to api
  # All params can be nil except 'url'
  def self.get_call(url: '', params: nil, headers: nil, body: body)
    response = Typhoeus.get(url, params: params, headers: headers, body: body)
    { 
      data: (JSON.parse(response.body) rescue {}),
      status: response.code
    }
  end

end