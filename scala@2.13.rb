class ScalaAT213 < Formula
  desc "JVM-based programming language"
  homepage "https://www.scala-lang.org/"
  url "https://downloads.lightbend.com/scala/2.13.0-M4/scala-2.13.0-M4.tgz"
  mirror "https://downloads.typesafe.com/scala/2.13.0-M4/scala-2.13.0-M4.tgz"
  mirror "https://www.scala-lang.org/files/archive/scala-2.13.0-M4.tgz"
  version "2.13.0-M4"
  sha256 "ffb55a42c98662879a9966c464470e5fbc2ac11d7d276f6b3c811c37c3c6ddb5"

  bottle :unneeded

  keg_only :versioned_formula

  option "with-docs", "Also install library documentation"
  option "with-src", "Also install sources for IDE support"

  depends_on :java => "1.8+"

  resource "docs" do
    url "https://downloads.lightbend.com/scala/2.13.0-M4/scala-docs-2.13.0-M4.txz"
    mirror "https://www.scala-lang.org/files/archive/scala-docs-2.13.0-M4.txz"
    sha256 "255919aada09e5ed527b47b3523ed50de82ab0be83e995f5c5192e0e2b3e4bb1"
  end

  resource "src" do
    url "https://github.com/scala/scala/archive/v2.13.0-M4.tar.gz"
    sha256 "ecfea5a5338349d20ee7031a5a09a1a51041ea42d511879b6b9d157a278daedd"
  end

  resource "completion" do
    url "https://raw.githubusercontent.com/scala/scala-tool-support/0a217bc/bash-completion/src/main/resources/completion.d/2.9.1/scala"
    sha256 "95aeba51165ce2c0e36e9bf006f2904a90031470ab8d10b456e7611413d7d3fd"
  end

  def install
    rm_f Dir["bin/*.bat"]
    doc.install Dir["doc/*"]
    share.install "man"
    libexec.install "bin", "lib"
    bin.install_symlink Dir["#{libexec}/bin/*"]
    bash_completion.install resource("completion")
    doc.install resource("docs") if build.with? "docs"
    libexec.install resource("src").files("src") if build.with? "src"

    # Set up an IntelliJ compatible symlink farm in 'idea'
    idea = prefix/"idea"
    idea.install_symlink libexec/"src", libexec/"lib"
    idea.install_symlink doc => "doc"
  end

  test do
    file = testpath/"Test.scala"
    file.write <<-EOS.undent
      object Test {
        def main(args: Array[String]) {
          println(s"${2 + 2}")
        }
      }
    EOS

    out = shell_output("#{bin}/scala #{file}").strip
    # Shut down the compile server so as not to break Travis
    system bin/"fsc", "-shutdown"

    assert_equal "4", out
  end
end
