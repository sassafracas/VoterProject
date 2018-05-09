class User < ActiveRecord::Base
  has_many :subscriptionlists
  has_many :bills, through: :subscriptionlists

  def make_web_request(url, header)
    all_bills = RestClient.get(url, header)
    print JSON.parse(all_bills)
  end


  def recent_bills(userbilltype)

    url = "https://api.propublica.org/congress/v1/115/house/bills/#{userbilltype}.json"
    header = {"X-API-Key": "svHxmNx6wlYOtWDde7AoZQ02O3NGslkT966zrK9L"}
    bill_hash = make_web_request(url, header)
    bill_hash

  end

end
