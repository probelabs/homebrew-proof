class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260512145609"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260512145609/proof_0.1.0-main.20260512145609_darwin_arm64.tar.gz"
      sha256 "f1f92214c653a428ab86b81bc86f360c1961d068695d192bac8617dc5d5a7211"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260512145609/proof_0.1.0-main.20260512145609_darwin_amd64.tar.gz"
      sha256 "0d4c9a3b1365c831de3906b0965b59754c87741bd002cf3c7fcec75b41a5cd24"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260512145609/proof_0.1.0-main.20260512145609_linux_arm64.tar.gz"
      sha256 "e08630709a08e87d37ca3ef4ca5ace0b4c1e5889cfd19a89c29760bc744dface"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260512145609/proof_0.1.0-main.20260512145609_linux_amd64.tar.gz"
      sha256 "10cdd991f4c6241206cfd7089487d906e56c93625fc1da3912c20574081bf3d0"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260512145609", output
  end
end
