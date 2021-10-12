defmodule PickingAndDelivery.Pickings.Core.GetAllStoresWithPickings do
  alias PickingAndDelivery.Pickings.Data.Store
  @query [%{
    "$group" => %{
      "_id" => "$store",
      "products" => %{
        "$push" => %{"name" => "$product", "_id" => "$_id", "delivered" => "$delivered"}
      }
    }
  }]

  def all do
    :mongo
    |> Mongo.aggregate("orders", @query)
    |> Enum.map(&Store.new(&1["_id"], &1["products"]))
  end
end
