defmodule PickingAndDeliveryWeb.PickingLive do
  use PickingAndDeliveryWeb, :live_view
  alias PickingAndDelivery.Pickings

  def mount(_assigns, _session, socket) do
    {:ok, socket}
  end

  defp select_store(stores, id) do
    if id == nil do
      nil
    else
      Enum.find(stores, &(&1.id == id))
    end
  end

  def handle_params(params, _, socket) do
    stores = Pickings.all_stores_with_pickings()
    selected_store = select_store(stores, params["id"])
    socket = assign(socket, stores: stores, selected_store: selected_store)
    {:noreply, socket}
  end

  def handle_event("store-clicked", id, socket) do
    selected_store = select_store(socket.assigns.stores, id)

    socket =
      socket
      # |> assign(selected_store: selected_store)
      # |> push_patch(to: "/pickings?id=#{id}")

    {:noreply, socket}
  end
end
