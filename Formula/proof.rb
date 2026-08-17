class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260817065309"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817065309/proof_0.1.0-main.20260817065309_darwin_arm64.tar.gz"
      sha256 "e862c6f8930a1b51a9a1cda7ff03e3463b3458aed15edc893191b2ff44aad02f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817065309/proof_0.1.0-main.20260817065309_darwin_amd64.tar.gz"
      sha256 "3737305afc325dea57868049c6e01e9da8558e21ab0c0c4c3acd356a82d807ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817065309/proof_0.1.0-main.20260817065309_linux_arm64.tar.gz"
      sha256 "bc103799a91ad1a76616285e53dbe37afbcbf9cb82696f0c3fbf769fd050c3aa"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817065309/proof_0.1.0-main.20260817065309_linux_amd64.tar.gz"
      sha256 "f03dba93bebd05c2f43fabf16d69fd35206d4426e1c9353f36ab26ec80a8b374"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260817065309", output
  end
end
