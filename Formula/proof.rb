class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427191900"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427191900/proof_0.1.0-main.20260427191900_darwin_arm64.tar.gz"
      sha256 "d29d2d8ef9d4935cb5269463f15a7e268c575fd789123469756379b9beb60523"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427191900/proof_0.1.0-main.20260427191900_darwin_amd64.tar.gz"
      sha256 "8dd80efafbdc14bf3c9ef4d8eb81ccde97e7add4921788189de9bd026187430d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427191900/proof_0.1.0-main.20260427191900_linux_arm64.tar.gz"
      sha256 "6dee8bcbd51e621192cc12a70dbda458043b6f81d9105fec52f3c041c709d41f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427191900/proof_0.1.0-main.20260427191900_linux_amd64.tar.gz"
      sha256 "bb1b98b06af9805b8b94a30d2239fc29aa929cda91a14367da91e83b4d60fbdf"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427191900", output
  end
end
