class HomeController < ApplicationController
  def home  
    files = ["Drizzle.png","Mostly Cloudy.png","Slight Drizzle.png","Thunderstorms.png","Cloudy.png","Haze.png","Snow.png","Sunny.png"]
    @weather = files[rand(files.length)]
  end  
end
