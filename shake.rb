require "language/haskell"

class Shake < Formula
  include Language::Haskell::Cabal

  desc "Build system library, like Make, but more accurate dependencies"
  homepage "https://shakebuild.com/"
  url "https://hackage.haskell.org/package/shake-0.17.7/shake-0.17.7.tar.gz"
  version "0.17.7"
  sha256 "3b832b61936e5e590c84d760b1db0e89f1400fa2fdda3f69c54f529a0c19f725"

  depends_on "cabal-install" => :build
  depends_on "ghc" => :build

  def install
    cabal_sandbox do
      install_cabal_package
    end
  end
end
