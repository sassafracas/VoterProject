#This will work with the web request method to get the 20 most recent bill numbers (we can use the bill numbers to get more info on the bills)
def most_recent_bills(userbillsorttype)
  url = "https://api.propublica.org/congress/v1/115/house/bills/#{userbillsorttype}.json"
  header = {"X-API-Key": "svHxmNx6wlYOtWDde7AoZQ02O3NGslkT966zrK9L"}
  most_recent_bill = {}
  bill_hash = make_web_request(url, header)
    bill_hash["results"].each do |results_hash|
      results_hash.each do |results_hash_key, results_hash_value|
        if results_hash_key == "bills"
          results_hash[results_hash_key].each do |bill_hash|
            #binding.pry Can iterate through this array to get all recent bills.
            bill_hash.each do |key, value|
              if key == "bill_slug"
              most_recent_bill[key.to_sym] = value
              elsif key == "short_title"
              most_recent_bill[key.to_sym] = value
              elsif key == "sponsor_name"
              most_recent_bill[key.to_sym] = value
              end
            end
          end
        end
      end
    end

    recentbill = Bill.find_or_create_by(name: most_recent_bill[:bill_slug], sponsor: most_recent_bill[:sponsor_name], short_title: most_recent_bill[:short_title])
  end

  def find_bill_by_subject(billsubjectmatter)
    url = "https://api.propublica.org/congress/v1/bills/search.json?query=#{billsubjectmatter}"
    header = {"X-API-Key": "svHxmNx6wlYOtWDde7AoZQ02O3NGslkT966zrK9L"}
    bill_by_subject = {}
    bill_subject_hash = make_web_request(url, header)
    bill_subject_hash["results"].each do |results_hash|
      results_hash.each do |results_hash_key, results_hash_value|
        if results_hash_key == "bills"
          results_hash[results_hash_key].select do |bill_hash|
            bill_hash.each do |key, value|
              if key == "bill_slug"
              bill_by_subject[key.to_sym] = value
              elsif key == "short_title"
              bill_by_subject[key.to_sym] = value
              elsif key == "sponsor_name"
              bill_by_subject[key.to_sym] = value
              end
            end
          end
        end
      end
    end
    recentsubjectbill = Bill.find_or_create_by(name: bill_by_subject[:bill_slug], sponsor: bill_by_subject[:sponsor_name], short_title: bill_by_subject[:short_title])
    recentsubjectbill
  end

#This meethod will get a better description of the bill.
def bill_descriptions(bill_slug)
  url = "https://api.propublica.org/congress/v1/115/bills/#{bill_slug}.json"
  header = {"X-API-Key": "svHxmNx6wlYOtWDde7AoZQ02O3NGslkT966zrK9L"}
  bill_description_hash = make_web_request(url, header)
  bill_description_hash["results"].each do |results_hash|
    results_hash.each do |key, value|
      if key == "summary"
        if value.empty? == false
          puts value
        else
          puts "Sorry there's no description for this bill."
        end
      end
  end
end
end
