# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula
class Coursier < Formula
  desc "Pure Scala Artifact Fetching"
  homepage "https://get-coursier.io"
  url "https://github.com/coursier/coursier/releases/download/v2.0.0-RC5-6/cs-x86_64-apple-darwin"
  version "2.0.0-RC5-6"
  sha256 "c5010aa0e2ed7bbd132196f10f62edd8d3fd4415bc324ed982526f55e33af974"
  bottle :unneeded

  def install
    mv "cs-x86_64-apple-darwin", "coursier"
    bin.install "coursier"
  end

  test do
    ENV["COURSIER_CACHE"] = "#{testpath}/cache"
    output = shell_output("#{bin}/coursier launch io.get-coursier:echo:1.0.2 -- foo")
    assert_equal ["foo\n"], output.lines
  end
end
