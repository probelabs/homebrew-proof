class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260423201403"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260423201403/proof_0.1.0-main.20260423201403_darwin_arm64.tar.gz"
      sha256 "76eb75ec2795dcb11c62993dc377062424054fe31c980717b64fb3a844f8e047"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260423201403/proof_0.1.0-main.20260423201403_darwin_amd64.tar.gz"
      sha256 "8f2458450513cdf7a43ef90c046896d23964604d3f2508f36f78dfbfa03ac3dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260423201403/proof_0.1.0-main.20260423201403_linux_arm64.tar.gz"
      sha256 "21d71469c9d5abb22a6c2917ac24e61c1adb5449f5fb6699c4af020a2db1ea44"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260423201403/proof_0.1.0-main.20260423201403_linux_amd64.tar.gz"
      sha256 "433e7371659e3cecd754bcca5571591352fb622b66a6c8345ced4e036d584499"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260423201403", output
  end
end
