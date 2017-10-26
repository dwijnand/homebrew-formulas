require 'formula'

class TrailerCli < Formula
  desc "Managing Pull Requests and Issues For GitHub & GitHub Enterprise from the command line"
  homepage "https://github.com/ptsochantaris/trailer-cli"
  url "https://github.com/ptsochantaris/trailer-cli/releases/download/1.0.1/trailer101.zip"
  version "1.0.1"
  sha256 "e001f0fcff3823576e92abcc18d76fe754a245c655c1a74f09cd0c15d1c9689e"

  def install
    bin.install 'trailer'
  end
end
