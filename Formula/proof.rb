class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260817095751"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817095751/proof_0.1.0-main.20260817095751_darwin_arm64.tar.gz"
      sha256 "4f05b6fa97c27da4a09690c8360032639c2db11d74b190e44b19f67e252b6f54"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817095751/proof_0.1.0-main.20260817095751_darwin_amd64.tar.gz"
      sha256 "afec9a1ad201164e486f9d852668a4399b0ffe83fdf61c44c5c320a3f3a16843"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817095751/proof_0.1.0-main.20260817095751_linux_arm64.tar.gz"
      sha256 "50b7a9c65c1762b1e02196a2c54c6cf86c1e7cf1521a7ca71a7f6b87233aaf0a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817095751/proof_0.1.0-main.20260817095751_linux_amd64.tar.gz"
      sha256 "de98f3e3979ead00251814286477ae60f9b2aedcde89ea3e056509ed0a08199b"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260817095751", output
  end
end
