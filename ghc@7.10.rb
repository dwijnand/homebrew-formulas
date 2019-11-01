require "language/haskell"

class GhcAT710 < Formula
  include Language::Haskell::Cabal

  desc "Glorious Glasgow Haskell Compilation System"
  homepage "https://haskell.org/ghc/"
  url "https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-x86_64-apple-darwin.tar.xz"
  sha256 "852781d43d41cd55d02f818fe798bb4d1f7e52f488408167f413f7948cf1e7df"

  keg_only :versioned_formula

  def install
  end

  def post_install
    system "#{bin}/ghc-pkg", "recache"
  end

  test do
    (testpath/"hello.hs").write('main = putStrLn "Hello Homebrew"')
    system "#{bin}/runghc", testpath/"hello.hs"
  end
end
