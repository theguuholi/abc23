defmodule PickingAndDelivery.Pickings do
  alias PickingAndDelivery.Pickings.Core.GetAllStoresWithPickings
  alias PickingAndDelivery.Pickings.Core.UpdatePicking

  def all_stores_with_pickings do
    GetAllStoresWithPickings.all
  end

  def update_picking(id, products) do
    UpdatePicking.execute(id, products)
  end
end
