class User < ActiveRecord::Base
  has_many :subscriptionlists
  has_many :bills, through: :subscriptionlists

  def make_web_request(url, header)
    all_bills = RestClient.get(url, header)
    JSON.parse(all_bills)
  end


  def recent_bill_numbers(userbillsorttype)
    url = "https://api.propublica.org/congress/v1/115/house/bills/#{userbillsorttype}.json"
    header = {"X-API-Key": "svHxmNx6wlYOtWDde7AoZQ02O3NGslkT966zrK9L"}
    bill_hash = make_web_request(url, header)
    bill_numbers_array = []
      bill_hash["results"].each do |results_hash|
        results_hash.each do |results_hash_key, results_hash_value|
          if results_hash_key == "bills"
            results_hash[results_hash_key].select do |bill_hash|
              bill_hash.each do |key, value|
                if key == "bill_slug"
                  bill_numbers_array << value
                end
              end
            end
          end
        end
      end
      puts bill_numbers_array
    end

end
