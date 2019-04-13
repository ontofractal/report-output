defmodule HoumankaTest do
  use ExUnit.Case
  import Houmanka
  doctest Houmanka

  @output [
    %{
      1_554_422_400 => nil,
      1_555_027_200 => [
        %{first_name: "Josh", hours: 2.0, id: 24, last_name: "Proud"},
        %{first_name: "Jane", hours: 1.0, id: 29, last_name: "Smith"}
      ],
      1_555_632_000 => [%{first_name: "Josh", hours: 25.0, id: 24, last_name: "Proud"}],
      1_556_236_800 => [%{first_name: "Josh", hours: 1.0, id: 24, last_name: "Proud"}],
      1_556_841_600 => nil,
      1_557_446_400 => [%{first_name: "Houman", hours: 1.0, id: 29, last_name: "Kargaran"}],
      1_558_051_200 => nil,
      1_558_656_000 => nil,
      1_559_260_800 => nil,
      1_559_865_600 => nil,
      1_560_470_400 => [%{first_name: "Houman", hours: 1.0, id: 29, last_name: "Kargaran"}],
      1_561_075_200 => nil,
      1_561_680_000 => nil
    }
  ]

  test "produces correct output" do
    assert prepare_report() == @output
  end
end
