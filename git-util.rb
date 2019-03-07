class GitUtil < Formula
  desc "Miscellaneous git scripts and utilities"
  homepage "https://github.com/mjdominus/git-util"
  head 'git://github.com/mjdominus/git-util.git'

  def install
    bin.install Dir["git-*"]
  end
end
