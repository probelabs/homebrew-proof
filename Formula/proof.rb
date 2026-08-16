class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260816194347"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816194347/proof_0.1.0-main.20260816194347_darwin_arm64.tar.gz"
      sha256 "a737699705dd7ea61bb53c409b99aff6188708d1fd99554be9155d3017d44730"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816194347/proof_0.1.0-main.20260816194347_darwin_amd64.tar.gz"
      sha256 "705cccf722a827662e33b172df269addee1a739e23dc227ae222db9ded00bb77"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816194347/proof_0.1.0-main.20260816194347_linux_arm64.tar.gz"
      sha256 "01901ee6435b2f9b6af42e5f9bf7fd7cf2ecbe96152f26f3be20f744811a0b9f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816194347/proof_0.1.0-main.20260816194347_linux_amd64.tar.gz"
      sha256 "2fec72573a8e98f901af7cab707ea5409e286839b2e37b5079534bdea2e5a88b"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260816194347", output
  end
end
