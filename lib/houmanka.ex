defmodule Houmanka do
  @moduledoc """
  Documentation for Houmanka.
  """

  def prepare_report do
    for weekend <- weekends(), into: Map.new() do
      last_weekend = Timex.shift(weekend, days: -6)
      date_range = Date.range(weekend, last_weekend)

      user_events =
        for %{finish: f, user: user} <- events(), f in date_range  do
          user
        end
        |> Enum.chunk_by(& &1.id)
        |> Enum.map(fn events ->
          %{hd(events) | hours: events |> Enum.map(& &1.hours) |> Enum.sum()}
        end)
        |> Enum.sort_by(& &1.id)

      val = if Enum.empty?(user_events), do: nil, else: user_events
      key = Timex.to_unix(weekend)
      {key, val}
    end
    |> List.wrap()
  end

  def weekends do
    [
      ~D[2019-04-05],
      ~D[2019-04-12],
      ~D[2019-04-19],
      ~D[2019-04-26],
      ~D[2019-05-03],
      ~D[2019-05-10],
      ~D[2019-05-17],
      ~D[2019-05-24],
      ~D[2019-05-31],
      ~D[2019-06-07],
      ~D[2019-06-14],
      ~D[2019-06-21],
      ~D[2019-06-28]
    ]
  end

  def events do
    [
      %{
        finish: ~D[2019-04-08],
        user: %{first_name: "Josh", hours: 1.0, id: 24, last_name: "Proud"}
      },
      %{
        finish: ~D[2019-04-09],
        user: %{first_name: "Josh", hours: 1.0, id: 24, last_name: "Proud"}
      },
      %{
        finish: ~D[2019-04-09],
        user: %{first_name: "Jane", hours: 1.0, id: 29, last_name: "Smith"}
      },
      %{
        finish: ~D[2019-04-14],
        user: %{first_name: "Josh", hours: 25.0, id: 24, last_name: "Proud"}
      },
      %{
        finish: ~D[2019-04-20],
        user: %{first_name: "Josh", hours: 1.0, id: 24, last_name: "Proud"}
      },
      %{
        finish: ~D[2019-05-06],
        user: %{first_name: "Houman", hours: 1.0, id: 29, last_name: "Kargaran"}
      },
      %{
        finish: ~D[2019-06-12],
        user: %{first_name: "Houman", hours: 1.0, id: 29, last_name: "Kargaran"}
      }
    ]
  end
end
