class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260731164047"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731164047/proof_0.1.0-main.20260731164047_darwin_arm64.tar.gz"
      sha256 "4c1edcf8a02b36f440f7f58c68aa86a744b451d258dfa552fbc9e95817528466"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731164047/proof_0.1.0-main.20260731164047_darwin_amd64.tar.gz"
      sha256 "60ac7bdf915cb5ba6902fe44830831eb414e3275d88491804b507e41c45c14b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731164047/proof_0.1.0-main.20260731164047_linux_arm64.tar.gz"
      sha256 "3b0a0f67f6f0643a67b200d8414491ccc1ef0ae96e9e8f91a07d711838c602ee"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731164047/proof_0.1.0-main.20260731164047_linux_amd64.tar.gz"
      sha256 "6bce3f375a683aa97895d1e3940519acc767402c3ea4ec88a5a4332d228b9865"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260731164047", output
  end
end
