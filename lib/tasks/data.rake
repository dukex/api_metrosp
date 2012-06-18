# encoding: utf-8

require 'open-uri'


namespace :data do
  task line: :environment do
    parser = parser("http://www.metro.sp.gov.br/sua-viagem/terminais-rodoviarios/index.aspx")

    parser.search("#menuLinhas .linkLinha").each do |line|
      name = (line).text
      Line.create! name: name.gsub("-", " ").titlecase, raw_name: name.mb_chars.upcase.to_s
    end
  end

  task line_status: :environment do
    parser = parser("http://www.metro.sp.gov.br/Sistemas/direto-do-metro/diretoDoMetro.aspx")

     parser.search("#diretoMetro ul li").each do |status_line|
        raw_name = (status_line/".linha").text.mb_chars.upcase.to_s
        line = Line.find_by_raw_name(raw_name)
        Status.create! name: (status_line/".status").text.strip!, updated_at: Time.now, line_id: line.id
     end
  end

  task station: :environment do
    #
    parser = parser("http://www.metro.sp.gov.br/sua-viagem/linha-1-azul/estacao-jabaquara.aspx")
    parser.search("#menuLinhas ul li ul li a").each do |station_item|
      name = station_item.text
      link = "http://www.metro.sp.gov.br/#{station_item.attr("href")}"
      puts name
      puts "====="
      puts link

      parser_station = parser(link)
      puts map_url = parser_station.search("#mapaArredores img").attr("src").to_s.gsub("..", "http://www.metro.sp.gov.br/sua-viagem")
      puts address = parser_station.search("#localidade span").text.titlecase


      Station.where(name: name).first_or_create!(address: address, map_url: map_url)
      puts " "
      puts " ---- "
      puts " "
      puts " "
    end
  end
end



def parser(url)
  html = open(url).read
  Nokogiri::HTML(html)
end