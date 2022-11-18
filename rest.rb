require 'openssl'
   OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
require 'net/http'
require 'json'


# https://localhost:7139/api/employee


def title_select(email_str)

    #this parses our endpoint and returns JSON
    url = 'https://localhost:7139/api/employee'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    employees = JSON.parse(response)


    #empty list for correct matches
    matches = []

    #loop through each row of employees 
    employees.each do |row|
        # if employee email matches the string provided 
        #we add the employee title to our matches list
        if row['email'] == email_str
            matches << row['title']
        end

    end
    
    
    if matches.count > 0
        return matches[0]
    else 
        return "email not found"
    end 

end


puts title_select("add email here to test")
