defmodule PickingAndDelivery.Pickings.Data.Store do
  defstruct ~w/description id lat lng name products total_products/a
  alias PickingAndDelivery.Pickings.Data.Product

  def new(store, products) do
    %__MODULE__{
      name: store["name"],
      id: store["id"],
      description: store["description"],
      lat: store["lat"],
      lng: store["lng"],
      total_products: Enum.count(products),
      products: Enum.map(products, &Product.new/1)
    }
  end
end
