class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260810110114"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260810110114/proof_0.1.0-main.20260810110114_darwin_arm64.tar.gz"
      sha256 "1e7c4e1558132e7eb7036877fff10e74670600bb956a04356a906e292ac8d663"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260810110114/proof_0.1.0-main.20260810110114_darwin_amd64.tar.gz"
      sha256 "fcc05e1c336b182a4b564faa674075b5dd0ce832a78ae96e5f01e86ee71709b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260810110114/proof_0.1.0-main.20260810110114_linux_arm64.tar.gz"
      sha256 "098b6727fdfc2d3afdd98d5e4cdeca8ad6358a037538334a67acaab41bf028d3"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260810110114/proof_0.1.0-main.20260810110114_linux_amd64.tar.gz"
      sha256 "254a37d7a4b25a7f6e538623dfa973ab6ced54516ad6cf206de1dee97c17ad45"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260810110114", output
  end
end
