class GithubSearch
  def search
    results = []

    base_uri = "https://api.github.com/search/issues"
    username = CGI.escape("author:randallreedjr")
    type = CGI.escape("type:pr")
    per_page = "per_page=100"
    pages = [1,2,3]
    pages.each do |page_number|
      page = "page=#{page_number}"
      uri = URI("#{base_uri}?q=#{username}+#{type}&#{per_page}&#{page}")

      response = Net::HTTP.get_response(uri)
      if response.is_a?(Net::HTTPSuccess)
        response_body = response.body
        results.concat JSON.parse(response_body)["items"]
      end
    end
    if results.any?
      return results
    end
    return {}
  end
end
