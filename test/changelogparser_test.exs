import Changelogparser

defmodule ChangelogparserTest do
  use ExUnit.Case
  doctest Changelogparser

  test "parseVersions returns an array containing the versions" do
    changelog = """
    - Foo bar (i: @nerdbeere)

    ### v2.9.0 / 2016-09-05 11:18:57

    - Connect ViewabilityProvider tracking (#48) (i: @topa, r: @klipstein)

    ### v2.8.1 / 2016-08-26 14:03:28

    - Added a try catch around public callbacks (#47) (i: @vengarioth, r: @klipstein)
    """
    
    assert Changelogparser.parseVersions(changelog) === ["2.9.0", "2.8.1"]
  end
end
