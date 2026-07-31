class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260731151131"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731151131/proof_0.1.0-main.20260731151131_darwin_arm64.tar.gz"
      sha256 "abe78e0bd1833f181acadceadb79f4dba4056717df788583910887be201dcfbb"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731151131/proof_0.1.0-main.20260731151131_darwin_amd64.tar.gz"
      sha256 "87ac177a182b7e8881db6ad91f04adb9615fb34fcdbd06381fd4a93e7384f781"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731151131/proof_0.1.0-main.20260731151131_linux_arm64.tar.gz"
      sha256 "abb7ce58b30516183c3b8ab9833621dd450cd03fc8e0ab7f0a3ca8376e6f78b2"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731151131/proof_0.1.0-main.20260731151131_linux_amd64.tar.gz"
      sha256 "391c290718c93c72be0703541bd77ad883c58fd526ee263522fc13e47bbe714b"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260731151131", output
  end
end
