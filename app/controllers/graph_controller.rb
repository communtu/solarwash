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
       :background_colors  => 'transparent'
     }
#    g.font = File.expand_path('artwork/fonts/VeraBd.ttf', RAILS_ROOT)
    if session[:start].nil? then 
      session[:start] = Date.today.to_time+21600 # set start time to today, 6am
      session[:scale] = 720*60 # half a day
    end
    stop = session[:start]+session[:scale]
    wash = Energylog.where("time >= :start and time <= :stop",
    {:start => session[:start], :stop => stop})
    v = wash.map(&:external)
    p = wash.map(&:solar)
    s = wash.map{|e|[e.solar, e.external].min}
 
    g.data("externer Verbrauch", v)
    g.data("solarer Verbrauch", s)
    g.data("Produktion", p)

    g.labels = {0 => '00:00', 360 => '06:00', 720 => '12:00', 1080 => '18:00', 1439 => '00:00'}
    
    send_data(g.to_blob, :disposition => 'inline', :type => 'image/png', :filename => "gruff.png")
  end
  def zoom_in_graph
    session[:scale] /= 2
    logger.debug "scale: #{session[:scale]}"
    render "/home/update_graph/"
  end
end
