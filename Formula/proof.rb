class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260814134346"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814134346/proof_0.1.0-main.20260814134346_darwin_arm64.tar.gz"
      sha256 "f813315b07e8f6291fba743abe1fb872688297a197d6e8f1a410226d1da567e4"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814134346/proof_0.1.0-main.20260814134346_darwin_amd64.tar.gz"
      sha256 "9aadb5b9a3bd112f3592f9711cab6ff622216bfd681dda1027fa249c13114e70"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814134346/proof_0.1.0-main.20260814134346_linux_arm64.tar.gz"
      sha256 "8f5be09981439db5f6ebf5f549b29513a727297b0a7e74547011fb42f1eabefb"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814134346/proof_0.1.0-main.20260814134346_linux_amd64.tar.gz"
      sha256 "945c993673a1a2b7f30435bc6cefb9e8cece5ac856522585e6c6468ed1a09493"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260814134346", output
  end
end
