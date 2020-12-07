Spree::Order.class_eval do
  after_commit :mailchimp_sync, on: [:create, :update]

  private
  def mailchimp_sync
    SolidusMailchimpSync::OrderSynchronizer.new(self).auto_sync
  end
end
