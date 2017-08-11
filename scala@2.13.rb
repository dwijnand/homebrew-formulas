class ScalaAT213 < Formula
  desc "JVM-based programming language"
  homepage "https://www.scala-lang.org/"
  url "https://downloads.lightbend.com/scala/2.13.0-M2/scala-2.13.0-M2.tgz"
  mirror "https://downloads.typesafe.com/scala/2.13.0-M2/scala-2.13.0-M2.tgz"
  mirror "https://www.scala-lang.org/files/archive/scala-2.13.0-M2.tgz"
  sha256 "3b83c4165d6be1854078ace552dd424acca6ddf718a908f103c206847802e808"
  version "2.13.0-M2"

  bottle :unneeded

  keg_only :versioned_formula

  option "with-docs", "Also install library documentation"
  option "with-src", "Also install sources for IDE support"

  depends_on :java => "1.8+"

  resource "docs" do
    url "https://downloads.lightbend.com/scala/2.13.0-M2/scala-docs-2.13.0-M2.txz"
    mirror "https://www.scala-lang.org/files/archive/scala-docs-2.13.0-M2.txz"
    sha256 "add2e7d495aedeab0825b8214eb5782c0ab3fa4b65d2e763203d830364e9bbdc"
  end

  resource "src" do
    url "https://github.com/scala/scala/archive/v2.13.0-M2.tar.gz"
    sha256 "8077199f57c3b5422e7943254e8395128a3c0d4114688804f7c17d2ff8e93709"
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
