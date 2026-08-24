class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260824111405"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824111405/proof_0.1.0-main.20260824111405_darwin_arm64.tar.gz"
      sha256 "47076db4357c4e6e0d75261baa14c98fd44179d3c4b2204c2f31d2920db71280"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824111405/proof_0.1.0-main.20260824111405_darwin_amd64.tar.gz"
      sha256 "f505b8999ab504dd746d03166ac861748aba813725ec22b42988929182a9847a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824111405/proof_0.1.0-main.20260824111405_linux_arm64.tar.gz"
      sha256 "e4119ed7fa4806c4720d08125a2e5adc7bb36b10a9c42ef90910f87c6980ae32"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824111405/proof_0.1.0-main.20260824111405_linux_amd64.tar.gz"
      sha256 "6cd7525b1cc50043a5825625dbc2baf667358a8825d3b55b1f0eb89c5aec8b69"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260824111405", output
  end
end
