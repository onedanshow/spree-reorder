Deface::Override.new(
  virtual_path:  "spree/orders/show".freeze,
  name:          "add_order_show_reorder_link".freeze,
  insert_bottom: "[data-hook='links']".freeze,
  text:          "<%= link_to 'Reorder', reorder_order_path(@order), class: 'button' %>"
)
