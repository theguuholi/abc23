defmodule PickingAndDelivery.Pickings do
  alias PickingAndDelivery.Pickings.Core.GetAllStoresWithPickings

  def all_stores_with_pickings do
    GetAllStoresWithPickings.all
  end
end
