defmodule Changelogparser do
  def parseVersions(changelog) do
    lines = splitLines changelog
    versionHeadlines = filterVersionHeadlines lines

    Enum.map(versionHeadlines, fn(versionHeadline) ->
      [version, _date] = String.split(
        String.replace_leading(versionHeadline, "### ", ""),
        "/"
      )
      String.trim_leading(String.trim(version), "v")
    end)
  end

  defp filterVersionHeadlines(lines) do
    Enum.filter lines, fn(line) ->
      String.starts_with? line, "###"
    end
  end

  defp splitLines(changelog) do
    String.split(changelog, "\n")
  end
end
