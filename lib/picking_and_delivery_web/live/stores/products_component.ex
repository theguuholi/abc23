defmodule PickingAndDeliveryWeb.ProductsComponent do
  use PickingAndDeliveryWeb, :live_component
  alias PickingAndDelivery.Pickings

  def update(assigns, socket) do
    {:ok, assign(socket, assigns)}
  end

  def product(assigns) do
    product = assigns.product
    target = assigns.target
    ~H"""
    <li id={"product-" <> product.id}>
      <p><%= product.name %></p>
      <strong>Entregue?: </strong>
      <.picking_status product={product} target={target} />
    </li>
    """
  end

  def picking_status(assigns) do
    product = assigns.product
    target = assigns.target
    ~H"""
        <button id={"update-product-"<> product.id}
                disabled={product.delivered}
                phx-click="deliver"
                phx-target={target}
                phx-value-id={product.id}
        >
          <%= if product.delivered do %>
          Entregue
          <% else %>
          Entregar
          <% end %>
        </button>
    """
  end

  def handle_event("deliver", %{"id" => id}, socket) do
    products = Pickings.update_picking(id, socket.assigns.products)
    {:noreply, update(socket, :products, fn _ -> products end)}
  end
end
