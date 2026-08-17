class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260817163443"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817163443/proof_0.1.0-main.20260817163443_darwin_arm64.tar.gz"
      sha256 "c344868f3997140362f5cc4e47d8359dce184652e2d91f91ec3b69d53b8d33dc"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817163443/proof_0.1.0-main.20260817163443_darwin_amd64.tar.gz"
      sha256 "93da8188f9aaf04e50b6809ebf6174af097e037ed1bfdf986a7a942f6eebd32c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817163443/proof_0.1.0-main.20260817163443_linux_arm64.tar.gz"
      sha256 "78d3e234c5144d0cf84fc481dbe406025ec2b52e8e171065d9f9fb69f3f8c204"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817163443/proof_0.1.0-main.20260817163443_linux_amd64.tar.gz"
      sha256 "a8bb2e9cf445866ece9673c826c99f841d3cfe2f38af687687c059b502b0c9d8"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260817163443", output
  end
end
