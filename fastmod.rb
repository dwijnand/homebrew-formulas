class Fastmod < Formula
  desc "A fast partial replacement for the codemod tool"
  homepage "https://github.com/facebookincubator/fastmod"
  url "https://github.com/facebookincubator/fastmod/archive/v0.2.3.tar.gz"
  sha256 "5ce4ffd9e09ed300dc2f24f7b4bb980c61085b1db5ba3b1d492338474c9cb0a9"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
  end
end
