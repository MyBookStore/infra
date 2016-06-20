class Repositories
  ALL = %w(books_service customer_service order_service online_store order_service_client customer_service_client books_service_client)

  BUNDLED = Dir.glob('../*/Gemfile').map { |x| x.split('/')[1] }.select { |repo| ALL.include?(repo) }
  NON_BUNDLED = ALL - BUNDLED
end