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

    #g.title = "Gruff-o-Rama"
    
    v = [2+rand(1), 2+rand(2), 2+rand(3), 2+rand(4), 2+rand(4), 2+rand(4), 2+rand(4), 2+rand(5), 2+rand(5), 2+rand(5), 2+rand(4), 2+rand(5), 2+rand(6), 2+rand(7), 2+rand(6), 2+rand(6), 2+rand(5), 2+rand(5), 2+rand(5), 2+rand(4), 2+rand(4), 2+rand(4), 2+rand(4), 2+rand(3)]
    p = [0, 0,1, 1+rand(0), 1+rand(1), 2+rand(3), 3+rand(3), 3+rand(4), 4+rand(4), 4+rand(4), 3+rand(3), 2+rand(4), 2+rand(5), 2+rand(6), 2+rand(5), 2+rand(5), 2+rand(4), 2+rand(4), 2+rand(4), 2+rand(3), 2+rand(3), 0+rand(0), 1, 0]
    e = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    (0..23).each do |i|
      e[i] = [v[i],p[i]].min
    end
    g.data("externer Verbrauch", v)
    g.data("solarer Verbrauch", e)
    g.data("Produktion", p)

    g.labels = {0 => '00:00', 6 => '06:00', 12 => '12:00', 18 => '18:00', 24 => '00:00'}

    send_data(g.to_blob, :disposition => 'inline', :type => 'image/png', :filename => "gruff.png")
  end

end
