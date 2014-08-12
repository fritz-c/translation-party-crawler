# encoding: utf-8

# Time to wait to reach equilibrium or fail, in seconds
PROCESS_TIME_LIMIT = 30

# Regex to split up the input text into chunks
TEXT_DELIMITER_REGEX = /[\n\.]+[\s\.]*/

# Output file paths
OUT_FILE_PATH_LINE_TO_LINE = "line2line.txt"
OUT_FILE_PATH_ORIGINALS    = "originals.txt"
OUT_FILE_PATH_TRANSLATED   = "translated.txt"

TRANSLATION_PARTY_SITE_URL = 'http://translationparty.com'

require 'Nokogiri'
require 'capybara'

def get_translation(text)
  C.first('textarea').set(text)
  C.click_button 'Find equilibrium'
  countdown = PROCESS_TIME_LIMIT

  # Wait as long as there is no end card
  while C.has_no_css?('.card.inverted') && (countdown -= 1) > 0
    sleep 1
  end

  # Reached equilibrium or failure within the alloted time (roughly 30 seconds)
  if countdown > 0
    # Pass the 'html' variable provided by capybara into Nokogiri
    mypage = Nokogiri::HTML C.html

    # In the case of success, the last English translation will be the second from the bottom,
    # but failure results in it being the third from the bottom
    if mypage.at_css('.card.inverted.abject_failure')
      return mypage.css('.card')[-3].css('p').last.text
    elsif mypage.at_css('.card.inverted.success')
      return mypage.css('.card')[-2].css('p').last.text
    end
  end
  return false;
end

def write_to_file(translations, originals)
  File.open(OUT_FILE_PATH_ORIGINALS,    'w') { |file| originals.each    { |s| file.puts(s) }}
  File.open(OUT_FILE_PATH_TRANSLATED,   'w') { |file| translations.each { |s| file.puts(s) }}
  File.open(OUT_FILE_PATH_LINE_TO_LINE, 'w') do |file| 
    for i in 0..originals.count - 1
      file.puts(originals[i])
      file.puts(">>> #{translations[i]}\n\n")
    end
  end
end


C = Capybara
C.default_driver = :selenium
C.app_host = TRANSLATION_PARTY_SITE_URL

if STDIN.tty?
   puts "You need to feed an input file into the script like so:\n$ ruby crawl.rb < in.txt"
   exit
end

input_string = STDIN.read

originals = input_string.split(TEXT_DELIMITER_REGEX).reject { |s| s.empty? }
translations = Array.new

originals.each do |text|
  C.visit '/'
  translation = get_translation(text)
  translations.push(translation)
  puts text
  puts ">>> #{translation}\n\n"
end

write_to_file(translations,originals)
