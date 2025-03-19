require "open-uri"

class PagesController < ApplicationController
  def home
  end

  def web
  end

  def english
  end

  def projet_web
  end

  def test

    today = Date.today.strftime("%Y-%m-%d")
    end_date = (Date.today + 15).strftime("%Y-%m-%d")

    url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/paris/#{today}/#{end_date}?unitGroup=us&elements=datetimeEpoch%2Ctemp%2Cfeelslike%2Cconditions%2Cdescription%2Cicon&include=obs%2Cdays&key=#{ENV["WEATHER_KEY"]}&contentType=json"


    begin
      response = JSON.parse(URI.parse(url).read)
      puts JSON.parse(URI.parse(url).read).inspect


      if response["days"].present?
        today = Date.today

        # Filtrer uniquement les jours >= aujourd'hui
        @daily_weather = response["days"]
                          .select { |day| Time.at(day["datetimeEpoch"]).utc.to_date >= today }
                          .map do |day|
          {
            "datetime" => Time.at(day["datetimeEpoch"]).utc.to_date.to_s,
            "temp" => day["temp"],
            "feelslike" => day["feelslike"],
            "description" => day["description"].empty? ? "No description available" : day["description"],
            "icon" => day["icon"]
          }
        end

        puts @daily_weather

      else
        @daily_weather = []
      end

    rescue StandardError => erreur
      Rails.logger.error "Aucune donnée météo trouvée: #{erreur.message}"
    end
  end
end
