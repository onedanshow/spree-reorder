Spree::Core::Engine.routes.draw do
  match '/orders/:id/reorder' => 'orders#reorder', :via => :get, :as => :reorder_order
end
