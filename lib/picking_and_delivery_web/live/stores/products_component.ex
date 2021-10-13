defmodule PickingAndDeliveryWeb.ProductsComponent do
  use PickingAndDeliveryWeb, :live_component
  alias PickingAndDelivery.Pickings

  def update(assigns, socket) do
    {:ok, assign(socket, assigns)}
  end

  def handle_event("deliver", %{"id" => id}, socket) do
    products = Pickings.update_picking(id, socket.assigns.products)
    {:noreply, update(socket, :products, fn _ -> products end)}
  end
end
