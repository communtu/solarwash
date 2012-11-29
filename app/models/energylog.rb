class Energylog < ActiveRecord::Base
  attr_accessible :external, :solar, :time
  def self.fill
#    wash = [1,23,51,31,1093,1916,1919,1912,1922,1905,1912,1906,1915,1900,1913,1903,1910,1901,1909,1896,1902,1897,1906,1899,1903,1893,861,61,1170,2009,2005,2006,2005,2001,1995,1998,1999,1995,2000,2003,2006,1999,912,60,69,60,129,176,174,173,117,62,48,20,21,141,168,170,167,85,57,29,19,45,173,171,170,154,60,47,4,42,171,170,169,161,62,200,674,539,117,115,170,169,123,59,309,775,776,777,770,762,245]
#    v = wash*15 + [0]*45
    now = Date.today.to_time
    external = 2000
    for d in (0..364) do
      puts "Day #{d}"
      season = 6+d/60
      for m in (0..1439) do
        t = now+(d*1440+m)*60
        solar = [0,3000-5*(m-720)*(m-720)*season*season/864/10].max
        external += rand(101)-50
        Energylog.create(:external => external, :solar => solar, :time => t)
      end
    end
  end
end
