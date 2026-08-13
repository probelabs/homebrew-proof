class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260813123812"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260813123812/proof_0.1.0-main.20260813123812_darwin_arm64.tar.gz"
      sha256 "28e9a24aed59835f784e2de90813ee028b75ebffb3c2e097a00f67bbdf85b0e5"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260813123812/proof_0.1.0-main.20260813123812_darwin_amd64.tar.gz"
      sha256 "a4a354c1bdc5440b124eac0a228294a43dcad055f1ce7c27b7c75c9a9ca0223e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260813123812/proof_0.1.0-main.20260813123812_linux_arm64.tar.gz"
      sha256 "c22ff2f705a59354f31b1bdbe82f31ee7e7c6899c9d815217b71d37346fd13f0"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260813123812/proof_0.1.0-main.20260813123812_linux_amd64.tar.gz"
      sha256 "28ea3c665032b0cede2f7ef210313f47a6d8da8b7c659df83834ef631292540a"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260813123812", output
  end
end
