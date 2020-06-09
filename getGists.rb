#!/usr/bin/env ruby
require 'open-uri'
require 'json'
# Username to download with default
username = "parttimelegend" if ARGV[0].nil?
# New gists array we can populate as we go.
new_gists = []
# Read the gists from github
read_gists = URI.open("https://api.github.com/users/#{username}/gists").read
# Parse the JSON from github
json_gists = JSON.parse read_gists
gist_list = File.readlines('gist_list.txt')

# Iterate through the gists
json_gists.each_with_index do |gist, index|
	gist_str = open(gist['url']).read
	gist = JSON.parse gist_str
	gist["files"].each do |file_name, file_value|
		File.open("#{file_name}", 'w') { |f| f.write file_value['content']}
		unless gist_list.include?(file_name)	
			File.open(gist_list_file, 'a') do |file|
				file.write "#{file_name}\n"
			end
			new_gists.push(file_name) 
		end
	end
end
if new_gists.length > 0
	puts "We found the following new gists"
	puts new_gists
else
	puts "No new gists since last run"
end