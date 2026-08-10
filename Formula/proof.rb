class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260810060008"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260810060008/proof_0.1.0-main.20260810060008_darwin_arm64.tar.gz"
      sha256 "79b418e39626c1e68785a7ba1861f1853106d3db7891104aafcea68f8e011970"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260810060008/proof_0.1.0-main.20260810060008_darwin_amd64.tar.gz"
      sha256 "756e911d1d5bffbd81d39c8f1d540dc18b8d945bf357aa5ed564d0e3ef2bbf78"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260810060008/proof_0.1.0-main.20260810060008_linux_arm64.tar.gz"
      sha256 "e69b4c01bae202473309ec58815113fdbc74335801b69a62e2d33f5208618375"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260810060008/proof_0.1.0-main.20260810060008_linux_amd64.tar.gz"
      sha256 "2972aaaa4742bc14ea8a5de7d02497263445a053ed68f60b7793928317e62243"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260810060008", output
  end
end
