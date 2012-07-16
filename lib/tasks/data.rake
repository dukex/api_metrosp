# encoding: utf-8
#


require 'open-uri'

namespace :data do
  desc "Get All Data"
  task all: %w{data:line data:line_status data:station}

  desc "Get Line Data"
  task line: :environment do
    parser = parser_url("http://www.metro.sp.gov.br/sua-viagem/terminais-rodoviarios/index.aspx")

    parser.search("#menuLinhas .linkLinha").each do |line|
      name = (line).text
      line = Line.where(raw_name: name.pt_br.upcase).first_or_create!
      line.update_attributes name: name.gsub("-", " ").pt_br.titlecase
    end
  end

  desc "Get Line Status"
  task line_status: :environment do
    parser = parser_url("http://www.metro.sp.gov.br/Sistemas/direto-do-metro/diretoDoMetro.aspx")

     parser.search("#diretoMetro ul li").each do |status_line|
        raw_name = (status_line/".linha").text.pt_br.upcase
        line = Line.find_by_raw_name(raw_name)
        status_name = (status_line/".status").text.strip!

        Status.create! name: status_name, updated_at: Time.now, line_id: line.id

        puts "-- Created Status to #{line.name}"
        puts "Status: #{status_name}"
        puts "------"
     end
  end

  desc "Get Station data"
  task station: :environment do
    parser = parser_url("http://www.metro.sp.gov.br/sua-viagem/linha-1-azul/estacao-jabaquara.aspx")
    parser.search("#menuLinhas ul li ul li a").each do |station_item|
      name = station_item.text
      link = "http://www.metro.sp.gov.br#{station_item.attr("href")}"
      puts name
      puts "====="
      puts link

      parser_station = parser_url(link)
      map_url = parser_station.search("#mapaArredores img").attr("src").to_s.gsub("..", "http://www.metro.sp.gov.br/sua-viagem")
      address = parser_station.search("#localidade span").text.pt_br.titlecase
      line = Line.find_by_name(link.match(/(linha.*)\//)[1].gsub("-", " ").pt_br.titlecase)

      station = Station.where(name: name).first_or_create!
      station.update_attributes address: address, map_url: map_url, line_id: line.id
      puts " "
      puts "---- "
      puts " "
      puts " "
    end
  end
end

class String
  def pt_br
    self.mb_chars
  end
end

def parser_url(url)
  html = open(url).read
  Nokogiri::HTML(html)
end
