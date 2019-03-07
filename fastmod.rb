class Fastmod < Formula
  desc "A fast partial replacement for the codemod tool"
  homepage "https://github.com/facebookincubator/fastmod"
  url "https://github.com/facebookincubator/fastmod/archive/v0.2.1.tar.gz"
  sha256 "746b6b0f8e2b9a3fb2d2144a234ef30b6d88c6d38dcd499d30e644bb761d2593"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
  end
end
