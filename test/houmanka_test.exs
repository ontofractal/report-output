defmodule HoumankaTest do
  use ExUnit.Case
  import Houmanka
  doctest Houmanka

  @output [
    %{
      "2019-04-05": nil,
      "2019-04-12": [
        %{first_name: "Josh", hours: 2.0, id: 24, last_name: "Proud"},
        %{first_name: "Jane", hours: 1.0, id: 29, last_name: "Smith"}
      ],
      "2019-04-19": [%{first_name: "Josh", hours: 25.0, id: 24, last_name: "Proud"}],
      "2019-04-26": [%{first_name: "Josh", hours: 1.0, id: 24, last_name: "Proud"}],
      "2019-05-03": nil,
      "2019-05-10": [%{first_name: "Houman", hours: 1.0, id: 29, last_name: "Kargaran"}],
      "2019-05-17": nil,
      "2019-05-24": nil,
      "2019-05-31": nil,
      "2019-06-07": nil,
      "2019-06-14": [%{first_name: "Houman", hours: 1.0, id: 29, last_name: "Kargaran"}],
      "2019-06-21": nil,
      "2019-06-28": nil
    }
  ]

  test "produces correct output" do
    assert prepare_report() == @output
  end
end
