class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260818105614"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818105614/proof_0.1.0-main.20260818105614_darwin_arm64.tar.gz"
      sha256 "92e0dab38722b2c1dadfc96e8f834a7193b084f08907d91ebd77cf6167445b3f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818105614/proof_0.1.0-main.20260818105614_darwin_amd64.tar.gz"
      sha256 "8c682238dc6705dd103aba4d973863a8c88400874e91361e171242085d86135d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818105614/proof_0.1.0-main.20260818105614_linux_arm64.tar.gz"
      sha256 "841e3e8154458fc3e892cd6d3fa5b8739e0f5054576203081dd137344a1bc411"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818105614/proof_0.1.0-main.20260818105614_linux_amd64.tar.gz"
      sha256 "087de788762b406162e280e82374f25cb75701c1fa8790cd3a283590b58c7216"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260818105614", output
  end
end
