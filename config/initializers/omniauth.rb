# Tells Rails to load OmniAuth on start and lets it use the strategy called "identity"

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :identity
end