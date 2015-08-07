Spree::OrdersController.class_eval do
  def reorder
    populator = Spree::OrderPopulator.new(current_order(create_order_if_necessary: true), current_currency)
    order = Spree::Order.where( number: params[:id] ).first

    if order.line_items.select {|li| populator.populate(li.variant.id, li.quantity) }.any?
      respond_with(@order) do |format|
        format.html { redirect_to cart_path }
      end
    else
      flash[:error] = populator.errors.full_messages.join(' '.freeze)
      redirect_to :back
    end

  end
end
