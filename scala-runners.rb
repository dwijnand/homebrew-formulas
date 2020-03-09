class ScalaRunners < Formula
  desc "Coursier-based alternative Scala runners"
  homepage "https://github.com/dwijnand/scala-runners"
  head 'git://github.com/dwijnand/scala-runners.git'

  depends_on "coursier/formulas/coursier"

  def install
    libexec.install Dir["scala*"]
    bin.install_symlink [libexec/"scala", libexec/"scalac", libexec/"scaladoc", libexec/"scalap"]
  end
end
