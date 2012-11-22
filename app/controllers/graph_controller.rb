class GraphController < ApplicationController
  
  # To make caching easier, add a line like this to config/routes.rb:
  # map.graph "graph/:action/:id/image.png", :controller => "graph"
  #
  # Then reference it with the named route:
  #   image_tag graph_url(:action => 'show', :id => 42)

  def show
    g = Gruff::Area.new
    # Uncomment to use your own theme or font
    # See http://colourlovers.com or http://www.firewheeldesign.com/widgets/ for color ideas
     g.theme = {
       :colors => ['#d90d02','#ff5904', '#FFEA01',   '#cc9966', '#99cc99'],
       :marker_color => 'black',
       :background_colors => ['white', 'white']
     }
#     g.font = File.expand_path('artwork/fonts/VeraBd.ttf', RAILS_ROOT)


# -5 x^2+120 x-640   
# -x^2+26 x-88

    #g.title = "Gruff-o-Rama"
    wash = [1,23,51,31,1093,1916,1919,1912,1922,1905,1912,1906,1915,1900,1913,1903,1910,1901,1909,1896,1902,1897,1906,1899,1903,1893,861,61,1170,2009,2005,2006,2005,2001,1995,1998,1999,1995,2000,2003,2006,1999,912,60,69,60,129,176,174,173,117,62,48,20,21,141,168,170,167,85,57,29,19,45,173,171,170,154,60,47,4,42,171,170,169,161,62,200,674,539,117,115,170,169,123,59,309,775,776,777,770,762,245]
    season = 6+rand(6)
    v = wash*15 + [0]*45
    p = (-720..719).map {|x|  [0,3000-5*x*x*season*season/864/10].max}
    e = []
    (0..1439).each do |i|
      e<< [v[i],p[i]].min
    end
    g.data("externer Verbrauch", v)
    g.data("solarer Verbrauch", e)
    g.data("Produktion", p)

    g.labels = {0 => '00:00', 360 => '06:00', 720 => '12:00', 1080 => '18:00', 1440 => '00:00'}

    send_data(g.to_blob, :disposition => 'inline', :type => 'image/png', :filename => "gruff.png")
  end

end
