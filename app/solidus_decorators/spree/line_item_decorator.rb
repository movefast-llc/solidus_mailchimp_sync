Spree::LineItem.class_eval do
  after_commit :mailchimp_sync, on: [:create, :update]

  def mailchimp_sync
    # If a LineItem changes, tell the order to Sync for sure.
    SolidusMailchimpSync::OrderSynchronizer.new(order).auto_sync(force: true)
  end
end
