require "csv"
require "sunlight/congress"
require "erb"
#template_letter = File.read "form_letter.html"
template_letter2 = File.read "form_letter.erb"

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

puts "EventManager Initialized!"
#contents = File.read "event_attendees.csv"
#puts contents

def clean_zipcode(zipcode)
	if zipcode == NIL
		zipcode = "00000"
	elsif zipcode.length < 5
		zipcode = zipcode.rjust 5,"0"
	else
		zipcode = zipcode[0..4]
	end
end


def find_legislator_names(zipcode)
	legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
	
	#method 1:
	#legislators_names =[]
	#legislators.each do |legislator|
	#	legislator_name = "#{legislator.first_name} #{legislator.last_name}"
	#	legislators_names.push legislator_name
	#end

	#method 2:
	legislator_names = legislators.collect do |legislator|
        "#{legislator.first_name} #{legislator.last_name}"
	end

	legislators_string = legislator_names.join(", ")

end

	
def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end


contents = CSV.read "event_attendees.csv" , headers: true, header_converters: :symbol
erb_template = ERB.new template_letter2
contents.each do |row|
	id = row[0]
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
 	#legislators_string = find_legislator_names(row[:zipcode])
	legislators_string = legislators_by_zipcode(zipcode)
	#personal_letter = template_letter.gsub('FISRT_NAME',name)
	#personal_letter.gsub!('LEGISLATORS', legislators_string)
	#puts personal_letter

	form_letter = erb_template.result(binding)
	#puts form_letter

	Dir.mkdir("output") unless Dir.exists? "output"
  	filename = "output/thanks_#{id}.html"
	File.open(filename,'w') do |file|
              file.puts form_letter
 	end

        #puts "#{name} #{zipcode} #{legislators_string}"
	
	
#lines = File.readlines "event_attendees.csv"
#row_index = 0
#lines.each do |line|
	#row_index = row_index+1
	#next if row_index == 1
	#columns = line.split(",")
	#puts columns
end


