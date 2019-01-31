# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
class Scalafmt < Formula
  desc "Code formatter for Scala"
  homepage "https://scalameta.org/scalafmt/"
  version "2.0.0-RC4"

  def install
    system "coursier", "bootstrap",
                       "org.scalameta:scalafmt-cli_2.12:#{version}",
                       "-o", "#{prefix}/scalafmt",
                       "--standalone",
                       "--main", "org.scalafmt.cli.Cli"
  end
end
