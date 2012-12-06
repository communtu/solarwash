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
 #    g. render_transparent_background
     g.theme = {
       :colors => ['#d90d02','#ff5904', '#FFEA01',   '#cc9966', '#99cc99'],
       :marker_color => 'black', 
       :background_colors => ['white', 'white']
     }
#    g.font = File.expand_path('artwork/fonts/VeraBd.ttf', RAILS_ROOT)
    if session[:start].nil? then 
      session[:start] = Date.today.to_time+21600 # set start time to today, 6am
      session[:scale] = 720*60
    end
    stop = session[:start]+session[:scale]
    wash = Energylog.where("time >= :start and time <= :stop",
    {:start => session[:start], :stop => stop})
    v = 
    p = 
    s = wash.map
    end
    g.data("externer Verbrauch", v)
    g.data("solarer Verbrauch", s)
    g.data("Produktion", p)

    g.labels = {0 => '00:00', 360 => '06:00', 720 => '12:00', 1080 => '18:00', 1439 => '00:00'}
    
    g.write("gruff.png")
    system "convert gruff.png -transparent white gruff1.png"
    send_file("gruff1.png", :disposition => 'inline', :type => 'image/png', :filename => "gruff.png")
    #send_data(g.to_blob, :disposition => 'inline', :type => 'image/png', :filename => "gruff.png")
  end

end
