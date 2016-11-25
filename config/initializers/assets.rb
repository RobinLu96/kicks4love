# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( bootstrap.min.css landing-page.css main.css)
Rails.application.config.assets.precompile += %w( jquery-1.8.3.js main.js )
Rails.application.config.assets.precompile += %w( common.css )
Rails.application.config.assets.precompile += %w( feature.css )
Rails.application.config.assets.precompile += %w( index.css )
Rails.application.config.assets.precompile += %w( font-awesome.min.css )
Rails.application.config.assets.precompile += %w( article.js feature.js)
Rails.application.config.assets.precompile += %w( trend.css)
Rails.application.config.assets.precompile += %w( feature.js)
