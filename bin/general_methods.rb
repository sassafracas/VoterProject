#This will be used to make web requests, it will be used with each specific method to get the data the specific method needs
def make_web_request(url, header)
  all_bills = RestClient.get(url, header)
  JSON.parse(all_bills)
end
