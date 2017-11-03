Dir.glob(File.expand_path('core_ext/*.rb', File.dirname(__FILE__))).each do |path|
  require path
end
