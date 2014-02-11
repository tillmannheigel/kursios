# Ralph: http://guides.rubyonrails.org/asset_pipeline.html is wrong
# Tillmann: https://www.ruby-forum.com/topic/3300305
Rails.application.config.assets.paths << (Rails.root.join("fcgi-bin","tillmannheigel", "assets")).to_s