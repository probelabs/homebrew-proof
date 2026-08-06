class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260806074032"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260806074032/proof_0.1.0-main.20260806074032_darwin_arm64.tar.gz"
      sha256 "e586346cc4cfef9cedf3f46c857a0de9da7c67ad4a3661e958f53771a341fa14"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260806074032/proof_0.1.0-main.20260806074032_darwin_amd64.tar.gz"
      sha256 "8f81b5e1ad63a00906a50fa23b38d9cd24e84418b9d979925d6dc8b5bb123b94"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260806074032/proof_0.1.0-main.20260806074032_linux_arm64.tar.gz"
      sha256 "d65f66f89c403e0eb8176ecb113c5fdb559d9959af1d019fe2910db4e493a515"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260806074032/proof_0.1.0-main.20260806074032_linux_amd64.tar.gz"
      sha256 "5cb96b35f4b1b021e40fe8c0a28f452316deb428d8433f3a2c8a8c7000ea4f3a"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260806074032", output
  end
end
