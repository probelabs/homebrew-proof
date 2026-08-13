class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260813062449"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260813062449/proof_0.1.0-main.20260813062449_darwin_arm64.tar.gz"
      sha256 "dc680fadd1a5088544751513c82a1a57e04edaba83270d26ab91c979893d86f3"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260813062449/proof_0.1.0-main.20260813062449_darwin_amd64.tar.gz"
      sha256 "2af53b13462f99f126077ef8169e7824b29ae8ab7cf79a67392c6811ddc7130f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260813062449/proof_0.1.0-main.20260813062449_linux_arm64.tar.gz"
      sha256 "b4701e1ffaae77fd25cb9f7bc2a2eb415902ba766fd79f97a45ba93a95bb7e7a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260813062449/proof_0.1.0-main.20260813062449_linux_amd64.tar.gz"
      sha256 "cabf927af66d1504acc70653161c98f722035869e8dfd4723973d499f026008f"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260813062449", output
  end
end
