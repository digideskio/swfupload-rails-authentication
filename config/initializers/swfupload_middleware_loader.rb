Rails.application.config.middleware.insert_before(
  ActionDispatch::Session::CookieStore, FlashSessionCookieMiddleware, Rails.application.config.session_options[:key]
)