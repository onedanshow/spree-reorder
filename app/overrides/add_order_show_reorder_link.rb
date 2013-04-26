Deface::Override.new(:virtual_path    => "spree/orders/show",
                     :name            => "add_order_show_reorder_link",
                     :insert_bottom   => "[data-hook='links']",
                     :text            => "<%= link_to \"Reorder\", reorder_order_path(@order), class: 'button' %>")
