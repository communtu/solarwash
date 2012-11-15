class GraphController < ApplicationController
  
  # To make caching easier, add a line like this to config/routes.rb:
  # map.graph "graph/:action/:id/image.png", :controller => "graph"
  #
  # Then reference it with the named route:
  #   image_tag graph_url(:action => 'show', :id => 42)

  def show
    g = Gruff::StackedArea.new
    # Uncomment to use your own theme or font
    # See http://colourlovers.com or http://www.firewheeldesign.com/widgets/ for color ideas
     g.theme = {
       :colors => ['red', 'yellow', 'blue', '#cc9966', '#99cc99'],
       :marker_color => 'black',
       :background_colors => ['white', 'white']
     }
#     g.font = File.expand_path('artwork/fonts/VeraBd.ttf', RAILS_ROOT)

    g.title = "Gruff-o-Rama"
    
    g.data("Produktion", [1, 2, 3, 4, 4, 4, 4, 5, 5, 5, 4, 5, 6, 7, 6, 6, 5, 5, 5, 4, 4, 4, 4, 3])
    g.data("Verbrauch", [0, 1, 2, 3, 3, 3, 3, 4, 4, 4, 3, 4, 5, 6, 5, 5, 4, 4, 4, 3, 3, 3, 3, 2])

    g.labels = {0 => '00:00', 6 => '06:00', 12 => '12:00', 18 => '18:00', 24 => '00:00'}

    send_data(g.to_blob, :disposition => 'inline', :type => 'image/png', :filename => "gruff.png")
  end

end
