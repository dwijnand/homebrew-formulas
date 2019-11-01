class SbtClient < Formula
  desc "A thin client for sbt"
  homepage "https://github.com/cb372/sbt-client"
  url "https://github.com/cb372/sbt-client/releases/download/v0.1.2/sbt-client-v0.1.2-x86_64-apple-darwin.gz"
  version "0.1.2"
  sha256 "2ec26809166ed7a9283a8198a47ae4903e04d4283f334a05a4e314ec44d8554e"

  def install
    bin.install "sbt-client-v0.1.2-x86_64-apple-darwin" => "sbt-client"
  end
end
