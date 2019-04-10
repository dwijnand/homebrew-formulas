class ScalaAT213 < Formula
  desc "JVM-based programming language"
  homepage "https://www.scala-lang.org/"
  url "https://downloads.lightbend.com/scala/2.13.0-RC1/scala-2.13.0-RC1.tgz"
  mirror "https://www.scala-lang.org/files/archive/scala-2.13.0-RC1.tgz"
  mirror "https://downloads.typesafe.com/scala/2.13.0-RC1/scala-2.13.0-RC1.tgz"
  sha256 "5bcbc9c1de68f9806e2a5e79076de49464ef2458ce3bfcf913d89ca32c1a85e3"

  bottle :unneeded

  keg_only :versioned_formula

  depends_on :java => "1.8+"

  def install
    rm_f Dir["bin/*.bat"]
    doc.install Dir["doc/*"]
    share.install "man"
    libexec.install "bin", "lib"
    bin.install_symlink Dir[libexec/"bin/*"]

    # Set up an IntelliJ compatible symlink farm in 'idea'
    idea = prefix/"idea"
    idea.install_symlink libexec/"src", libexec/"lib"
    idea.install_symlink doc => "doc"
  end

  test do
    file = testpath/"Test.scala"
    file.write <<~EOS
      object Test {
        def main(args: Array[String]) {
          println(s"${2 + 2}")
        }
      }
    EOS

    out = shell_output("#{bin}/scala -nc #{file}").strip

    assert_equal "4", out
  end
end
