require 'formula'

class Sbtx < Formula
  homepage "https://github.com/paulp/sbt-extras"
  url "https://raw.githubusercontent.com/paulp/sbt-extras/4db8d5c27413f69297adfffac57485d88d73c60e/sbt"
  version "20210129"
  sha256 "25b8177ed65d6a8d90c58c229befad26096a64e0f6d9c07b6bddaa7cc58a0966"
  head "https://git.io/sbt", :using => :curl

  def install
    system "mv", "sbt", "sbtx"
    bin.install "sbtx"
  end
end
