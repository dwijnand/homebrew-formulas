class Jenv < Formula
  desc "Manage your Java environment"
  homepage "http://www.jenv.be"
  url "https://github.com/dwijnand/jenv/archive/0.4.5.tar.gz"
  sha256 "a038ab91962c8a1b14391eb383fc6472468c56338526a406f486e9ff6c794dbc"
  head "https://github.com/dwijnand/jenv.git"

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/jenv"
  end

  test do
    shell_output("eval \"$(#{bin}/jenv init -)\" && jenv versions")
  end
end
