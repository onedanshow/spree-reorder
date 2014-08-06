Spree::OrdersController.class_eval do

  # DD: stolen from orders_controller on Spree Core
  def reorder
    populator = Spree::OrderPopulator.new(current_order(create_order_if_necessary: true), current_currency)
    order = Spree::Order.where( number: params[:id] ).first

=begin
    # DD: ideally, create a params hash in this format and pass to populate, but it's not supported
    # +:products => { product_id => variant_id, product_id => variant_id }, :quantity => { variant_id => quantity, variant_id => quantity }+
    hash = { :products => {}, :quantity => {} }
    order.line_items.each do |line_item|
      hash[:products][line_item.product.id] = line_item.variant.id
      hash[:quantity][line_item.variant.id] = line_item.quantity
    end
=end

    if order.line_items.inject(true){|bool,li| populator.populate( li.variant.id, li.quantity  ) }
      fire_event('spree.cart.add')
      fire_event('spree.order.contents_changed')
      respond_with(@order) do |format|
        format.html { redirect_to cart_path }
      end
    else
      flash[:error] = populator.errors.full_messages.join(" ")
      redirect_to :back
    end

  end
end
