# encoding: utf-8

require 'open-uri'


namespace :data do
  task line: :environment do
    parser = parser(open("http://www.metro.sp.gov.br/sua-viagem/terminais-rodoviarios/index.aspx").read)

    parser.search("#menuLinhas .linkLinha").each do |line|
      name = (line).text
      Line.create! name: name.gsub("-", " ").titlecase, raw_name: name.mb_chars.upcase.to_s
    end
  end

  task line_status: :environment do
    parser = parser(open("http://www.metro.sp.gov.br/Sistemas/direto-do-metro/diretoDoMetro.aspx").read)

     parser.search("#diretoMetro ul li").each do |status_line|
        raw_name = (status_line/".linha").text.mb_chars.upcase.to_s
        line = Line.find_by_raw_name(raw_name)
        Status.create! name: (status_line/".status").text.strip!, updated_at: Time.now, line_id: line.id
     end
  end
end

def parser(html)
  Nokogiri::HTML(html)
end