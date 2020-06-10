#!/usr/bin/env ruby
require 'open-uri'
require 'json'
require 'fileutils'
# Define the local storage to gist_list.txt if it doesn't exist touch it to create.
gist_list_file = 'gist_list.txt'
FileUtils.touch(gist_list_file) unless File.file?(gist_list_file)
gist_list = File.readlines(gist_list_file, chomp: true)
puts "Gists already known #{gist_list}"
# Username to download with default
username = "parttimelegend" if ARGV[0].nil?
# New gists array we can populate as we go.
new_gists = []
# Read the gists from github
read_gists = URI.open("https://api.github.com/users/#{username}/gists").read
# Parse the JSON from github
json_gists = JSON.parse read_gists
# Iterate through the gists
json_gists.each_with_index do |gist, index|
	puts "Reading #{gist['url']}"
	read_gist = URI.open(gist['url']).read
	json_gist = JSON.parse read_gist
	json_gist["files"].each do |file_name, file_value|
		#File.open("#{file_name}", 'w') { |f| f.write file_value['content']}
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