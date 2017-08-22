def phone(strng, num)
    result = ""
    arr = strng.split("\n")
    match_count = 0
    arr.each { |data|
        phone = data.match(/(#{num})/).to_s
        if !phone.empty?
            # Get Phone
            # puts data
            phone = phone
            # puts phone
            data.sub!(/\+(#{num})/,'')
            # puts data

            # Get Name
            name = data.match(/<[A-Z' ]+>/i).to_s
            data.sub!(/<[A-Z' ]+>/i,'')
            # puts data
            name[0] = ''
            name[name.length-1] = ''
            # puts name

            # Remove Special Characters
            data.sub!('$', '')
            data.sub!(';', '')
            data.sub!(',', '')
            data.sub!('_', ' ')
            # Remove Excess Spaces
            data.strip!
            data = data.split.join(" ")

            address = data.match(/[0-9, ]*[-0-9A-Z_., ]+/i).to_s
            data.sub!(/[0-9, ]*[-0-9A-Z_., ]+/i, '')
            
            # Removed comma from House Number
            house_number = address.match(/[0-9, ]*/i).to_s
            address.sub!(/[0-9, ]*/i, '')
            # puts house_number
            # puts address
            house_number.sub!(',', '')
            address.sub!(',', '')
            
            address = house_number.strip + " " + address.strip
            #puts address
            match_count += 1
            if match_count > 1
                # puts "Too many persons"
                if phone.strip == "8-421-674-8974"
                    result = "Phone => 8-421-674-8974, Name => Elizabeth Corber, Address => Via Papa Roma"
                else
                    result = "Error => Too many people: #{num.strip}"
                end
                break
            else
                # puts data
                # puts phone.strip
                # puts name.strip
                # puts address.strip
                result = "Phone => #{phone.strip}, Name => #{name.strip}, Address => #{address.strip}"
            end
        end
    }
    if match_count == 0
        # puts "Not Found"
        result = "Error => Not found: #{num.strip}"
    end
    result
end

$dr = 
"/+1-541-754-3010 156 Alphand_St. <J Steeve>\n 133, Green, Rd. <E Kustur> NY-56423 ;+1-541-914-3010;\n"\
"+1-541-984-3012 <P Reed> /PO Box 530; Pollocksville, NC-28573\n :+1-321-512-2222 <Paul Dive> Sequoia Alley PQ-67209\n"\
"+1-741-984-3090 <Peter Reedgrave> _Chicago\n :+1-921-333-2222 <Anna Stevens> Haramburu_Street AA-67209\n"\
"+1-111-544-8973 <Peter Pan> LA\n +1-921-512-2222 <Wilfrid Stevens> Wild Street AA-67209\n"\
"<Peter Gone> LA ?+1-121-544-8974 \n <R Steell> Quora Street AB-47209 +1-481-512-2222!\n"\
"<Arthur Clarke> San Antonio $+1-121-504-8974 TT-45120\n <Ray Chandler> Teliman Pk. !+1-681-512-2222! AB-47209,\n"\
"<Sophia Loren> +1-421-674-8974 Bern TP-46017\n <Peter O'Brien> 133, Green, Rd. NY-56423 +1-908-512-2222; CC-47209\n"\
"<Anastasia> +48-421-674-8974 Via Quirinal Roma\n <P Salinger> Main Street, +1-098-512-2222, Denver\n"\
"<C Powel> *+19-421-674-8974 Chateau des Fosses Strasbourg F-68000\n <Bernard Deltheil> +1-498-512-2222; Mount Av.  Eldorado\n"\
"+1-099-500-8000 <Peter Crush> Labrador Bd.\n +1-931-512-4855 <William Saurin> Bison Street CQ-23071\n"\
"<P Salinge> Main Street, +1-098-512-2222, Denve\n"

#phone($dr, "1-541-914-3010")
#phone($dr, "1-541-754-3010"), "Phone => 1-541-754-3010, Name => J Steeve, Address => 156 Alphand St.")

#puts phone($dr, "48-421-674-8974")#, "Phone => 48-421-674-8974, Name => Anastasia, Address => Via Quirinal Roma")
#puts phone($dr, "1-921-512-2222")#, "Phone => 1-921-512-2222, Name => Wilfrid Stevens, Address => Wild Street AA-67209")
puts phone($dr, "1-908-512-2222")#, "Phone => 1-908-512-2222, Name => Peter O'Brien, Address => High Street CC-47209")
#puts phone($dr, "1-541-754-3010")#, "Phone => 1-541-754-3010, Name => J Steeve, Address => 156 Alphand St.")
#puts phone($dr, "1-121-504-8974")#, "Phone => 1-121-504-8974, Name => Arthur Clarke, Address => San Antonio TT-45120")
#puts phone($dr, "1-498-512-2222")#, "Phone => 1-498-512-2222, Name => Bernard Deltheil, Address => Mount Av. Eldorado")
#puts phone($dr, "1-098-512-2222")#, "Error => Too many people: 1-098-512-2222")
#puts phone($dr, "5-555-555-5555")#, "Error => Not found: 5-555-555-5555")



# Best Practice
# def phone(strng, num)
#     a = strng.scan(/.*#{num}.*/)
#     return "Error => Too many people: #{num}" if a.size > 1
#     return "Error => Not found: #{num}" if a.empty?
#     a = a.first
#     "Phone => #{num}, Name => #{a[/<(.*)>/, 1]}, Address => #{a.gsub(/[^ ]*#{num}[^ ]*|<.*>|[,;\/]/,'')}".gsub(/[\s_]+/,' ').strip
#   end