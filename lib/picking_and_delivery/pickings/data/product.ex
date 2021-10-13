defmodule PickingAndDelivery.Pickings.Data.Product do
  @derive {Jason.Encoder, only: ~w/name delivered id/a}
  defstruct ~w/name delivered id/a

  def new(product) do
    %__MODULE__{
      name: product["name"],
      delivered: product["delivered"],
      id: BSON.ObjectId.encode!(product["_id"])
    }
  end
end
